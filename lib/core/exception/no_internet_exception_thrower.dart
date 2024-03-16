import 'package:github_treasures/core/exception/exceptions.dart';
import 'package:github_treasures/core/network/connection_checker.dart';

abstract class NoInternetExceptionThrower {
  Future<bool> throwIfNoInternet();
}

class NoInternetExceptionThrowerImpl implements NoInternetExceptionThrower {
  final ConnectionChecker _connectionChecker;

  NoInternetExceptionThrowerImpl(this._connectionChecker);
  @override
  Future<bool> throwIfNoInternet() async {
    if (await _connectionChecker.isConnected()) return true;
    throw NoInternetException();
  }
}
