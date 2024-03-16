import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:github_treasures/core/domain/failure/failure.dart';

abstract class UseCase<Type, Params> {
  const UseCase();

  Future<Either<Failure, Type>> call({required Params params});
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
