import 'package:github_treasures/core/dependency/injector.dart';

abstract class InjectoionModule {
  Future<void> inject({
    required Injector injector,
  });
}
