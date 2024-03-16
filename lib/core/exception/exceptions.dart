class NoInternetException implements Exception {}

class ServerException implements Exception {
  final String message;
  ServerException({this.message = ''});
}

class CacheException implements Exception {
  final String message;
  CacheException({this.message = ''});
}

class ApiRequestFailureException implements Exception {
  final String? message;
  ApiRequestFailureException(this.message);
}

class TokenRefreshingFailureException implements Exception {
  final int statusCode;

  TokenRefreshingFailureException(this.statusCode);
}
