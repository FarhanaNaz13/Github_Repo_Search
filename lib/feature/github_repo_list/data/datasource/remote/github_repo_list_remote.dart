import 'dart:developer';

import 'package:github_treasures/core/config/api_config.dart';
import 'package:github_treasures/core/data/api_client/api_response_model.dart';
import 'package:github_treasures/core/data/api_client/get_api.dart';
import 'package:github_treasures/core/data/remote/authorized_remote.dart';
import 'package:github_treasures/feature/common/resource/api_end_points.dart';
import 'package:github_treasures/feature/github_repo_list/domain/usecase/github_repo_list_uc.dart';

abstract class GithubRepoListRemote {
  Future<ApiResponseModel> getList({
    required GithubRepoListParams params,
  });
}

class GithubRepoListRemoteImpl extends AuthorizedRemote
    implements GithubRepoListRemote {
  final GetApi _getApi;

  const GithubRepoListRemoteImpl({
    required super.authorizer,
    required GetApi getApi,
  }) : _getApi = getApi;

  @override
  Future<ApiResponseModel> getList({
    required GithubRepoListParams params,
  }) {
    final headers = super.getAuthHeaders();
    log(headers.toString(), name: "header");
    return super.runThroughAuthSequence(
          () => _getApi.call(
        "${ApiConfig.instance.baseUrl}/${ApiEndPoints.githubRepoListSearchUrl(
          query: params.query,
          sort: params.sort,
          order: params.order,
          page: params.page.toString(),
          perPage: params.perPage.toString(),
        )}",
        headers: super.getAuthHeaders(),
      ),
    );
  }
}
