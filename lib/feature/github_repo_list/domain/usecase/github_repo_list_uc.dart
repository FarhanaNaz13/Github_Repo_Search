import 'package:dartz/dartz.dart';
import 'package:github_treasures/core/domain/failure/failure.dart';
import 'package:github_treasures/core/usecases/usecase.dart';
import 'package:github_treasures/feature/github_repo_list/domain/entity/github_repo_list_entity_group.dart';
import 'package:github_treasures/feature/github_repo_list/domain/repository/github_repository_list.dart';

class GithubRepoListUc
    extends UseCase<GithubRepoListEntityGroup, GithubRepoListParams> {
  const GithubRepoListUc({
    required GithubRepoListRepository githubRepoListRepository,
  }) : _githubRepoListRepository = githubRepoListRepository;
  final GithubRepoListRepository _githubRepoListRepository;

  @override
  Future<Either<Failure, GithubRepoListEntityGroup>> call({
    required GithubRepoListParams params,
  }) =>
      _githubRepoListRepository.get(
        params: params,
      );
}

class GithubRepoListParams {
  final String query;
  final String sort;
  final String order;
  final int page;
  final int perPage;

  GithubRepoListParams({
    required this.query,
    required this.sort,
    required this.order,
    required this.page,
    required this.perPage,
  });
}
