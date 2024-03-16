import 'package:github_treasures/core/module/injection_module.dart';
import 'package:github_treasures/core/module/route_module.dart';

abstract class FeatureModule {
  RouteModule? get getRouteModule;
  InjectoionModule? get getInjectionModule;
}
