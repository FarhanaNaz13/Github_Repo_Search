import 'package:package_info_plus/package_info_plus.dart';

abstract class AppVersion {
  Future<String> call();
}

class AppVersionImpl implements AppVersion {
  @override
  Future<String> call() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
