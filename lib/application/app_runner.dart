import 'package:flutter/material.dart';
import 'package:github_treasures/application/github_treasures.dart';
import 'package:github_treasures/core/config/config_holder.dart';
import 'package:github_treasures/core/dependency/injector.dart';
import 'package:github_treasures/core/feature_container/feature_container.dart';
import 'package:github_treasures/feature/github_repo_list/data/datasource/local/register_adapter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class AppRunner {
  FeatureContainer get featureContainer;
  String get initialRoute;
  ServerConfig get serverConfig;
  FeatureConfig get featureConfig;

  Future<void> _preRun() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    // await initialiseHive();
  }

  Future<void> run() async {
    await _preRun();
    final appInjector = AppInjector();
    final injectionList = <Future>[];
    ConfigHolder.init(
      serverConfig: serverConfig,
      featureConfig: featureConfig,
    );
    for (final e in featureContainer.getInjectionModules()) {
      injectionList.add(
        e.inject(
          injector: appInjector,
        ),
      );
    }
    await Future.wait(injectionList);
    runApp(
      MyApp(
        routeMoudules: featureContainer.getRouteModules(),
        initialRoute: initialRoute,
        injector: appInjector,
      ),
    );
  }
}
