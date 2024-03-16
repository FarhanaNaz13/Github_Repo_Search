import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:github_treasures/core/exception/no_internet_exception_thrower.dart';

import '../../domain/failure/failure.dart';
import 'api_response_model.dart';

abstract class Api {
  final NoInternetExceptionThrower _noInternetExceptionThrower;
  Api({
    required NoInternetExceptionThrower noInternetExceptionThrower,
  }) : _noInternetExceptionThrower = noInternetExceptionThrower;
  Future<ApiResponseModel> runThroughExceptionCatcher(
    Future<ApiResponseModel> Function() f,
  ) async {
    try {
      final response = await f();
      if (response.statusCode >= 500 && response.statusCode <= 504) {
        throw const Failure.serverFailed();
      }
      return response;
    } on SocketException {
      try {
        await _noInternetExceptionThrower.throwIfNoInternet();
      } catch (e) {
        throw const Failure.noInternet();
      }
      throw const Failure.serverUnavailable();
    } on HttpException {
      throw const Failure.serverFailed();
    } on TimeoutException {
      throw const Failure.serverTimeout();
    } on Failure {
      rethrow;
    } catch (e) {
      log(e.toString(), name: 'unHandled');
      throw const Failure.unHandled();
    }
  }
}
