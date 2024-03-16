import 'package:dartz/dartz.dart';
import 'package:github_treasures/core/domain/failure/failure.dart';
import 'package:github_treasures/feature/github_repo_list/domain/entity/github_repo_list_entity_group.dart';
import 'package:github_treasures/feature/github_repo_list/domain/usecase/github_repo_list_uc.dart';

abstract class GithubRepoListRepository {
  const GithubRepoListRepository();
  Future<Either<Failure, GithubRepoListEntityGroup>> get({
    required GithubRepoListParams params,
  });
}
