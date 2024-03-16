import 'config_holder.dart';

abstract class _ApiConstants {
  //sprint
  static const devBaseUrl = 'https://api.github.com';
  static const devBaseAuthUrl = '';

  //prod
  static const prodBaseUrl = 'https://api.github.com';
  static const prodBaseAuthUrl = '';

  //qa
  static const qaBaseUrl = 'https://api.github.com';
  static const qaBaseAuthUrl = '';
}

class ApiConfig {
  final String baseUrl;
  final String baseAuthUrl;
  static ApiConfig get instance {
    return _instance!;
  }

  ApiConfig._internal({
    required this.baseUrl,
    required this.baseAuthUrl,
  });
  static ApiConfig? _instance;

  static _initDev() {
    _instance = ApiConfig._internal(
      baseUrl: _ApiConstants.devBaseUrl,
      baseAuthUrl: _ApiConstants.devBaseAuthUrl,
    );
  }

  static _initProd() {
    _instance = ApiConfig._internal(
      baseUrl: _ApiConstants.prodBaseUrl,
      baseAuthUrl: _ApiConstants.prodBaseAuthUrl,
    );
  }

  static _initQA() {
    _instance = ApiConfig._internal(
      baseUrl: _ApiConstants.qaBaseUrl,
      baseAuthUrl: _ApiConstants.qaBaseAuthUrl,
    );
  }

  static init({
    required ServerConfig serverConfig,
  }) {
    switch (serverConfig) {
      case ServerConfig.dev:
        ApiConfig._initDev();
        break;
      case ServerConfig.prod:
        ApiConfig._initProd();
        break;
      case ServerConfig.qa:
        ApiConfig._initQA();
        break;
    }
  }
}
