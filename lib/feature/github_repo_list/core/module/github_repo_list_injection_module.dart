import 'package:github_treasures/core/data/api_client/get_api.dart';
import 'package:github_treasures/core/data/remote/authorizer.dart';
import 'package:github_treasures/core/dependency/injector.dart';
import 'package:github_treasures/core/module/injection_module.dart';
import 'package:github_treasures/feature/github_repo_list/data/datasource/local/github_repo_item_local.dart';
import 'package:github_treasures/feature/github_repo_list/data/datasource/remote/github_repo_list_remote.dart';
import 'package:github_treasures/feature/github_repo_list/data/mapper/github_repo_list_json_to_model.dart';
import 'package:github_treasures/feature/github_repo_list/data/mapper/github_repo_list_model_group_mapper.dart';
import 'package:github_treasures/feature/github_repo_list/data/mapper/github_repo_list_model_to_entity.dart';
import 'package:github_treasures/feature/github_repo_list/data/model/github_repo_item_model.dart';
import 'package:github_treasures/feature/github_repo_list/data/repository_impl/github_repo_list_impl.dart';
import 'package:github_treasures/feature/github_repo_list/domain/repository/github_repository_list.dart';
import 'package:github_treasures/feature/github_repo_list/domain/usecase/github_repo_list_uc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GithubRepoListInjectionModule implements InjectoionModule {
  @override
  Future<void> inject({required Injector injector}) async {
    ///remote
    injector.registerLazySingleton<GithubRepoListRemote>(
      () => GithubRepoListRemoteImpl(
        authorizer: injector.get<Authorizer>(),
        getApi: injector.get<GetApi>(),
      ),
    );
    const repoItemKey = 'repo';
    Hive.registerAdapter(GithubRepoItemModelAdapter());
    final repoBox = await Hive.openBox<GithubRepoItemModel?>(repoItemKey);
    //adapters

    injector.registerLazySingleton<GitHubRepoItemLocal>(
      () => GitHubRepoItemLocal(
        githubRepoBox: repoBox,
      ),
    );

    ///mapper
    injector.registerFactory(() => JsonToGithubRepoListModelMapper());
    injector.registerFactory(() => const GithubRepoListModelToEntityMapper());

    injector.registerFactory(
      () => GithubRepoListModelGroupMapper(
        jsonToModelMapper: injector.get<JsonToGithubRepoListModelMapper>(),
        mapper: injector.get<GithubRepoListModelToEntityMapper>(),
        gitHubRepoItemLocal: injector.get<GitHubRepoItemLocal>(),
      ),
    );

    ///repo
    injector.registerLazySingleton<GithubRepoListRepository>(
      () => GithubRepoListRepositoryImpl(
        modelGroupMapper: injector.get<GithubRepoListModelGroupMapper>(),
        githubRepoListRemoteImpl: injector.get<GithubRepoListRemote>(),
        noInternetThrower: injector.get(),
      ),
    );

    ///usecase
    injector.registerLazySingleton(
      () => GithubRepoListUc(
        githubRepoListRepository: injector.get(),
      ),
    );
  }
}
