import 'package:dartz/dartz.dart';

import '../../domain/failure/failure.dart';

abstract class Repository {
  Future<Either<Failure, TRight>> runThroughFailureCatcher<TRight>(
    Future<Either<Failure, TRight>> Function() f,
  ) async {
    try {
      final right = await f();
      return right;
    } on Failure catch (failure) {
      return Left(
        failure,
      );
    } on Exception {
      return const Left(
        Failure.unHandled(),
      );
    }
  }
}
