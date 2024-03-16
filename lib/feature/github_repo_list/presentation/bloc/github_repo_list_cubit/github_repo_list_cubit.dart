import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_treasures/core/domain/failure/failure.dart';
import 'package:github_treasures/feature/github_repo_list/data/datasource/local/github_repo_item_local.dart';
import 'package:github_treasures/feature/github_repo_list/data/mapper/github_repo_list_model_to_entity.dart';
import 'package:github_treasures/feature/github_repo_list/domain/entity/github_repository_list_entity.dart';
import 'package:github_treasures/feature/github_repo_list/domain/usecase/github_repo_list_uc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_repo_list_cubit.freezed.dart';
part 'github_repo_list_state.dart';

class GithubRepoListCubit extends Cubit<GithubRepoListState> {
  final GithubRepoListUc _githubRepoListUc;
  final GitHubRepoItemLocal _gitHubRepoItemLocal;
  final GithubRepoListModelToEntityMapper _entityMapper;

  GithubRepoListCubit({
    required GithubRepoListUc githubRepoListUc,
    required GitHubRepoItemLocal gitHubRepoItemLocal,
    required GithubRepoListModelToEntityMapper entityMapper,
  })  : _githubRepoListUc = githubRepoListUc,
        _gitHubRepoItemLocal = gitHubRepoItemLocal,
        _entityMapper = entityMapper,
        super(const GithubRepoListState.initial());

  Future<void> getList({
    required GithubRepoListParams params,
  }) async {
    final localRepos = await _gitHubRepoItemLocal.fetchAllLocalRepos();
    if (localRepos.isNotEmpty) {
      final localReposEntityList = _entityMapper.entityListMap(localRepos);
      emit(GithubRepoListState.loaded(localReposEntityList));
    } else {
      emit(const GithubRepoListState.loading());
      final etherResult = await _githubRepoListUc.call(params: params);
      etherResult.fold(
        (failure) {
          failure.maybeWhen(
            noInternet: () async {
              final localRepos =
                  await _gitHubRepoItemLocal.fetchAllLocalRepos();

              final localReposEntityList =
                  _entityMapper.entityListMap(localRepos);
              emit(GithubRepoListState.loaded(localReposEntityList));
            },
            orElse: () {},
          );
          emit(GithubRepoListState.failure(failure));
        },
        (entityGroup) => entityGroup.when(
          success: (entityList) => emit(GithubRepoListState.loaded(entityList)),
          notFound: () => emit(const GithubRepoListState.notFound()),
          badRequest: () => emit(const GithubRepoListState.badRequest()),
          unKnown: () => emit(const GithubRepoListState.unKnown()),
          forbidden: () => emit(const GithubRepoListState.unKnown()),
        ),
      );
    }
  }
}
