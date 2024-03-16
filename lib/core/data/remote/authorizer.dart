import 'package:github_treasures/core/data/api_client/api_response_model.dart';
import 'package:github_treasures/core/data/api_client/request_date_time_genrator.dart';
import 'package:github_treasures/core/data/api_client/request_id_generator.dart';

import 'remote_keys.dart';

abstract class Authorizer {
  Map<String, String> getAuthHeaders();
  Future<void> reAuthorize();
}

class AuthorizerImpl implements Authorizer {
  final RequestDateTimeStringGenerator _requestDateTimeStringGenerator;
  final RequestIdGenerator _requestIdGenerator;

  AuthorizerImpl({
    required RequestDateTimeStringGenerator requestDateTimeStringGenerator,
    required RequestIdGenerator requestIdGenerator,
  })  :
        _requestDateTimeStringGenerator = requestDateTimeStringGenerator,
        _requestIdGenerator = requestIdGenerator;

  @override
  Future<void> reAuthorize() async {}

  Future<void> _updateTokens({
    required ApiResponseModel apiResponseModel,
  }) async {}

  @override
  Map<String, String> getAuthHeaders() {
    return Map<String, String>.from(RemoteKeys.preLoginHeader);
      // ..putIfAbsent(
      //   RemoteKeys.kKeyOfAuth,
      //   () => "${RemoteKeys.kPrefixOfToken}jfjsisajfiroeroewkpkrdngmnfdmn",
      // )
      // ..putIfAbsent(
      //   RemoteKeys.kRequestId,
      //   () => _requestIdGenerator.generate(),
      // )
      // ..putIfAbsent(
      //   RemoteKeys.kRequestTime,
      //   () => _requestDateTimeStringGenerator.generate(),
      // );
  }
}

abstract class PreAuthorizationHeader {
  Map<String, String> getHeaders();
}

class PreAuthorizationHeaderImpl implements PreAuthorizationHeader {
  final RequestIdGenerator requestIdGenerator;
  final RequestDateTimeStringGenerator requestDateTimeStringGenerator;

  PreAuthorizationHeaderImpl({
    required this.requestIdGenerator,
    required this.requestDateTimeStringGenerator,
  });
  @override
  Map<String, String> getHeaders() {
    Map<String, String> preAuthHeader = Map.from(RemoteKeys.preLoginHeader);
    preAuthHeader.putIfAbsent(
      RemoteKeys.kRequestId,
      requestIdGenerator.generate,
    );
    preAuthHeader.putIfAbsent(
      RemoteKeys.kRequestTime,
      requestDateTimeStringGenerator.generate,
    );

    return preAuthHeader;
  }
}
