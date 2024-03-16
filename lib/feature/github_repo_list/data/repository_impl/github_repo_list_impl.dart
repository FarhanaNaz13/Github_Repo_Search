import 'package:dartz/dartz.dart';
import 'package:github_treasures/core/data/repository/repository.dart';
import 'package:github_treasures/core/domain/failure/failure.dart';
import 'package:github_treasures/core/exception/exceptions.dart';
import 'package:github_treasures/core/exception/no_internet_exception_thrower.dart';
import 'package:github_treasures/feature/github_repo_list/data/datasource/remote/github_repo_list_remote.dart';
import 'package:github_treasures/feature/github_repo_list/data/mapper/github_repo_list_model_group_mapper.dart';
import 'package:github_treasures/feature/github_repo_list/domain/entity/github_repo_list_entity_group.dart';
import 'package:github_treasures/feature/github_repo_list/domain/repository/github_repository_list.dart';
import 'package:github_treasures/feature/github_repo_list/domain/usecase/github_repo_list_uc.dart';

class GithubRepoListRepositoryImpl extends Repository
    implements GithubRepoListRepository {
  final GithubRepoListRemote _githubRepoListRemoteImpl;
  final GithubRepoListModelGroupMapper _modelGroupMapper;
  final NoInternetExceptionThrower _noInternetThrower;

  GithubRepoListRepositoryImpl({
    required GithubRepoListRemote githubRepoListRemoteImpl,
    required GithubRepoListModelGroupMapper modelGroupMapper,
    required NoInternetExceptionThrower noInternetThrower,
  })  : _githubRepoListRemoteImpl = githubRepoListRemoteImpl,
        _modelGroupMapper = modelGroupMapper,
        _noInternetThrower = noInternetThrower;
  @override
  Future<Either<Failure, GithubRepoListEntityGroup>> get({
    required GithubRepoListParams params,
  }) async {
    try {
      await _noInternetThrower.throwIfNoInternet();
      return super.runThroughFailureCatcher(
        () async {
          final response = await _githubRepoListRemoteImpl.getList(
            params: params,
          );
          final groupData = _modelGroupMapper.map(response);
          return Right(groupData);
        },
      );
    } on NoInternetException {
      return const Left(Failure.noInternet());
    } on Exception {
      return const Left(Failure.unHandled());
    } on Error {
      return const Left(Failure.unHandled());
    }
  }
}
