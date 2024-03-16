import 'package:github_treasures/core/data/api_client/api_response_model.dart';
import 'package:github_treasures/core/data/remote/authorizer.dart';

abstract class AuthorizedRemote {
  final Authorizer _authorizer;

  const AuthorizedRemote({
    required Authorizer authorizer,
  }) : _authorizer = authorizer;
  Future<ApiResponseModel> runThroughAuthSequence(
    Future<ApiResponseModel> Function() f,
  ) async {
    final apiResponseModel = await f();
    final shouldReauthorize = this.shouldReauthorize(
      apiResponseModel: apiResponseModel,
    );
    if (shouldReauthorize) {
      await _authorizer.reAuthorize();
      return await f();
    }
    return apiResponseModel;
  }

  Map<String, String> getAuthHeaders() => _authorizer.getAuthHeaders();
  bool shouldReauthorize({
    required ApiResponseModel apiResponseModel,
  }) {
    return apiResponseModel.statusCode == 401;
  }
}
