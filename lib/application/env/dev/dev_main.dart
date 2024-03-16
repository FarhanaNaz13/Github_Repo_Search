import 'package:github_treasures/application/app_runner.dart';
import 'package:github_treasures/application/env/dev/dev_feature_container.dart';
import 'package:github_treasures/core/config/config_holder.dart';
import 'package:github_treasures/core/feature_container/feature_container.dart';
import 'package:github_treasures/feature/github_repo_list/core/route/github_repo_list_route_module.dart';

class DevAppRunner extends AppRunner {
  @override
  FeatureContainer get featureContainer => DevFeatureContainer();

  @override
  FeatureConfig get featureConfig => FeatureConfig.dev;

  @override
  String get initialRoute => GithubRepoListRouteModule.githubRepoListFeatureScreen;

  @override
  ServerConfig get serverConfig => ServerConfig.dev;
}

void main(List<String> args) {
  DevAppRunner().run();
}
