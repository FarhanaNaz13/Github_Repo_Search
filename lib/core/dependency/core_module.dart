import 'package:github_treasures/core/dependency/core_injection_module.dart';
import 'package:github_treasures/core/module/feature_module.dart';
import 'package:github_treasures/core/module/injection_module.dart';
import 'package:github_treasures/core/module/route_module.dart';

class CoreModule extends FeatureModule {
  @override
  InjectoionModule? get getInjectionModule => CoreInjectionModule();

  @override
  RouteModule? get getRouteModule => null;
}
