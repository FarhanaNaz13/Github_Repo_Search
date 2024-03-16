import 'dart:typed_data';

class ApiResponseModel {
  final String url;
  final Map<String, String> headers;
  final int statusCode;
  final String body;
  final Uint8List bodyBytes;
  ApiResponseModel({
    required this.url,
    required this.headers,
    required this.statusCode,
    required this.body,
    required this.bodyBytes,
  });
}
