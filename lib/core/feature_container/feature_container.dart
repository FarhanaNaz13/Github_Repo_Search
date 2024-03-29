import 'package:github_treasures/core/module/feature_module.dart';
import 'package:github_treasures/core/module/injection_module.dart';
import 'package:github_treasures/core/module/route_module.dart';

abstract class FeatureContainer {
  final List<FeatureModule> featureList;

  FeatureContainer({
    required this.featureList,
  });

  List<RouteModule> getRouteModules() => featureList
      .map((e) => e.getRouteModule)
      .toList()
      .whereType<RouteModule>() // Excluding null RouteModule
      .toList();

  List<InjectoionModule> getInjectionModules() => featureList
      .map((e) => e.getInjectionModule)
      .toList()
      .whereType<InjectoionModule>() // Excluding null InjectoionModule
      .toList();
}
