import 'dart:developer';

import 'package:github_treasures/application/theme/my_dark_theme.dart';
import 'package:github_treasures/core/dependency/injector.dart';
import 'package:github_treasures/core/module/route_module.dart';
import 'package:flutter/material.dart';
import 'package:github_treasures/core/resource/constant/colors_resource.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatefulWidget {
  final List<RouteModule> routeMoudules;
  final String initialRoute;
  final AppInjector injector;

  const MyApp({
    super.key,
    required this.routeMoudules,
    required this.initialRoute,
    required this.injector,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (cxt) => "Github Repository List",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: ColorsResource.primary,
        ),
        colorScheme: MyLightTheme.colorScheme,
        textTheme: Theme.of(context).textTheme.copyWith(
              displayMedium: GoogleFonts.robotoMono(
                color: MyLightTheme.textColor,
              ),
            ),
      ),
      // themeMode: ThemeMode.dark,
      onGenerateRoute: (settings) => _generateRoute(
        settings,
        widget.injector,
      ),
      initialRoute: widget.initialRoute,
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (_) {
          return const Text('You should not be here!');
        },
        settings: settings,
      ),
    );
  }

  Route? _generateRoute(
    RouteSettings settings,
    AppInjector injector,
  ) {
    final routesMap = <String, Route>{};
    for (final routeModule in widget.routeMoudules) {
      final featureRouteMap = routeModule.get(
        routeSettings: settings,
        injector: injector,
      );
      routesMap.addAll(featureRouteMap);
    }
    final route = routesMap[settings.name];
    log(route.toString(), name: 'page route: ');
    return route;
  }
}
