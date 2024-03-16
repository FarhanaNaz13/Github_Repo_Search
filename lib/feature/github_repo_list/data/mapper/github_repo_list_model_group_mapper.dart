import 'dart:convert';

import 'package:github_treasures/core/data/api_client/api_response_model.dart';
import 'package:github_treasures/core/data/mapper/mapper.dart';
import 'package:github_treasures/feature/github_repo_list/data/datasource/local/github_repo_item_local.dart';
import 'package:github_treasures/feature/github_repo_list/data/mapper/github_repo_list_json_to_model.dart';
import 'package:github_treasures/feature/github_repo_list/data/mapper/github_repo_list_model_to_entity.dart';
import 'package:github_treasures/feature/github_repo_list/domain/entity/github_repo_list_entity_group.dart';

class GithubRepoListModelGroupMapper
    extends MapperImpl<ApiResponseModel, GithubRepoListEntityGroup> {
  final JsonToGithubRepoListModelMapper _jsonToModelMapper;
  final GithubRepoListModelToEntityMapper _entityMapper;
  final GitHubRepoItemLocal _gitHubRepoItemLocal;

  GithubRepoListModelGroupMapper({
    required JsonToGithubRepoListModelMapper jsonToModelMapper,
    required GithubRepoListModelToEntityMapper mapper,
    required GitHubRepoItemLocal gitHubRepoItemLocal,
  })  : _entityMapper = mapper,
        _jsonToModelMapper = jsonToModelMapper,
        _gitHubRepoItemLocal = gitHubRepoItemLocal;

  @override
  GithubRepoListEntityGroup map(ApiResponseModel tFrom) {
    return super.runThroughExceptionCatcher(
      () {
        switch (tFrom.statusCode) {
          case 200:
            final responseModel = _jsonToModelMapper.map(
              utf8.decode(tFrom.bodyBytes),
            );
            _gitHubRepoItemLocal.saveReposLocally(githubRepos: responseModel);

            final entityList = _entityMapper.map(responseModel);
            return GithubRepoListEntityGroup.success(entityList);
          case 404:
            return const GithubRepoListEntityGroup.notFound();
          case 400:
            return const GithubRepoListEntityGroup.badRequest();
          case 403:
            return const GithubRepoListEntityGroup.forbidden();
          default:
            return const GithubRepoListEntityGroup.unKnown();
        }
      },
    );
  }
}
