import 'package:github_treasures/core/dependency/core_module.dart';
import 'package:github_treasures/core/feature_container/feature_container.dart';

class ProdFeatureContainer extends FeatureContainer {
  ProdFeatureContainer()
      : super(
          featureList: [
            CoreModule(),
          ],
        );
}
