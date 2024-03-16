import 'package:flutter/material.dart';
import 'package:github_treasures/core/dependency/injector.dart';

abstract class RouteModule {
  Map<String, Route> get({
    required RouteSettings routeSettings,
    required AppInjector injector,
  });
}
