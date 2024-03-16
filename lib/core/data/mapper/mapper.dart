import 'dart:developer';
import 'package:github_treasures/core/domain/failure/failure.dart';

abstract class Mapper<TFrom, TTo> {
  const Mapper();
  TTo map(
    TFrom tFrom,
  );
}

abstract class MapperImpl<TFrom, TTo> implements Mapper<TFrom, TTo> {
  const MapperImpl();

  TTo runThroughExceptionCatcher(TTo Function() f) {
    try {
      return f();
    } catch (e, stackTrace) {
      log(e.toString(), name: 'runThroughExceptionCatcher');
      log(stackTrace.toString(), name: 'runThroughExceptionCatcher');
      throw const Failure.parsing();
    }
  }
}

