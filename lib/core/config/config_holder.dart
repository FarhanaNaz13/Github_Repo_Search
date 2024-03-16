import 'package:github_treasures/core/config/api_config.dart';

class ConfigHolder {
  static FeatureConfig? _featureConfig;
  static FeatureConfig get featureConfig => _featureConfig!;
  static ServerConfig? _serverConfig;
  static ServerConfig get serverConfig => _serverConfig!;
  ConfigHolder._init({
    required FeatureConfig featureConfig,
    required ServerConfig serverConfig,
  }) {
    _featureConfig = featureConfig;
    _serverConfig = serverConfig;
  }
  static void init({
    required FeatureConfig featureConfig,
    required ServerConfig serverConfig,
  }) {
    ConfigHolder._init(
      featureConfig: featureConfig,
      serverConfig: serverConfig,
    );
    ApiConfig.init(
      serverConfig: serverConfig,
    );
  }
}

enum ServerConfig {
  dev,
  qa,
  prod,
}

enum FeatureConfig {
  dev,
  qa,
  prod,
}
