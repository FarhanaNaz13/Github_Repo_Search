import 'dart:developer';

import 'package:github_treasures/core/data/api_client/api_response_model.dart';
import 'package:http/http.dart';
import 'package:github_treasures/core/data/api_client/api_client.dart';

abstract class GetApi {
  Future<ApiResponseModel> call(String url, {Map<String, String>? headers});
}

class GetApiImpl extends Api implements GetApi {
  final Client _client;
  GetApiImpl({
    required Client client,
    required super.noInternetExceptionThrower,
  }) : _client = client;

  @override
  Future<ApiResponseModel> call(String url, {Map<String, String>? headers}) {
    return super.runThroughExceptionCatcher(
      () async {
        Response response = await _client.get(
          Uri.parse(url),
          headers: headers,
        );
        log(response.statusCode.toString(),
            name: 'GetApi2impl response_status');
        log(response.body, name: 'GetApi2impl response_body');
        log(headers.toString(), name: 'headers');
        log(response.headers.toString(), name: 'response-headers');
        log(url.toString(), name: 'url');
        return ApiResponseModel(
          url: url,
          headers: response.headers,
          body: response.body,
          statusCode: response.statusCode,
          bodyBytes: response.bodyBytes,
        );
      },
    );
  }
}
