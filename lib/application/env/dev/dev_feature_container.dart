import 'package:github_treasures/core/dependency/core_module.dart';
import 'package:github_treasures/core/feature_container/feature_container.dart';
import 'package:github_treasures/feature/github_repo_list/core/feature/github_repo_list_feature.dart';

class DevFeatureContainer extends FeatureContainer {
  DevFeatureContainer()
      : super(
          featureList: [
            CoreModule(),
            GithubRepoListFeatureModule()
          ],
        );
}
