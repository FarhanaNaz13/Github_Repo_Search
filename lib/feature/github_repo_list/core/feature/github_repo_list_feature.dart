import 'package:github_treasures/core/module/feature_module.dart';
import 'package:github_treasures/core/module/injection_module.dart';
import 'package:github_treasures/core/module/route_module.dart';
import 'package:github_treasures/feature/github_repo_list/core/module/github_repo_list_injection_module.dart';
import 'package:github_treasures/feature/github_repo_list/core/route/github_repo_list_route_module.dart';

class GithubRepoListFeatureModule implements FeatureModule {
  @override
  InjectoionModule? get getInjectionModule => GithubRepoListInjectionModule();

  @override
  RouteModule? get getRouteModule => GithubRepoListRouteModule();
}
