
import 'package:github_treasures/application/app_runner.dart';
import 'package:github_treasures/application/env/prod/prod_feature_container.dart';
import 'package:github_treasures/core/config/config_holder.dart';
import 'package:github_treasures/core/feature_container/feature_container.dart';
import 'package:github_treasures/feature/github_repo_list/core/route/github_repo_list_route_module.dart';

class ProdAppRunner extends AppRunner {
  @override
  FeatureContainer get featureContainer => ProdFeatureContainer();

  @override
  FeatureConfig get featureConfig => FeatureConfig.prod;

  @override
  String get initialRoute => GithubRepoListRouteModule.githubRepoListFeatureScreen;

  @override
  ServerConfig get serverConfig => ServerConfig.prod;
}

void main(List<String> args) {
  ProdAppRunner().run();
}
