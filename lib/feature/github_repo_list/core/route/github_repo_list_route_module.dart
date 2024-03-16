import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_treasures/core/dependency/injector.dart';
import 'package:github_treasures/core/module/route_module.dart';
import 'package:github_treasures/feature/github_repo_list/data/datasource/local/github_repo_item_local.dart';
import 'package:github_treasures/feature/github_repo_list/domain/entity/github_repository_list_entity.dart';
import 'package:github_treasures/feature/github_repo_list/domain/usecase/github_repo_list_uc.dart';
import 'package:github_treasures/feature/github_repo_list/presentation/bloc/github_repo_list_cubit/github_repo_list_cubit.dart';
import 'package:github_treasures/feature/github_repo_list/presentation/screens/github_repo_details_screen.dart';
import 'package:github_treasures/feature/github_repo_list/presentation/screens/github_repo_list_feature_screen.dart';

class GithubRepoListRouteModule extends RouteModule {
  static const githubRepoListFeatureScreen = '/githubRepoListFeatureScreen';
  static const githubRepoListDetailScreen = '/githubRepoListDetailScreen';

  @override
  Map<String, Route> get({
    required RouteSettings routeSettings,
    required AppInjector injector,
  }) {
    return <String, Route>{
      githubRepoListFeatureScreen: MaterialPageRoute(
        settings: routeSettings,
        builder: (BuildContext context) {
          return BlocProvider(
            create: (BuildContext context) {
              return GithubRepoListCubit(
                githubRepoListUc: injector.get<GithubRepoListUc>(),
                gitHubRepoItemLocal: injector.get<GitHubRepoItemLocal>(),
                entityMapper: injector.get(),
              );
            },
            child: const GithubRepoListFeatureScreen(),
          );
        },
      ),
      githubRepoListDetailScreen: MaterialPageRoute(
        settings: routeSettings,
        builder: (BuildContext context) {
          final entityList = routeSettings.arguments as GithubRepoItemEntity;
          return GithubRepoDetailsScreen(repoItemEntity: entityList);
        },
      ),
    };
  }
}
