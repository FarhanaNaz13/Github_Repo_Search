import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:github_treasures/core/network/connection_checker.dart';

abstract class InternetConnectivityListener {
  void listen(Function(ConnectivityState) onConnectionStatechange);
  void cancelListening();
}

enum ConnectivityState {
  connected,
  notConnected,
  initial,
}

class InternetConnectivityListenerImpl implements InternetConnectivityListener {
  final Connectivity connectivity;
  final ConnectionChecker connectionChecker;
  StreamSubscription<ConnectivityResult>? _subscription;

  InternetConnectivityListenerImpl({
    required this.connectivity,
    required this.connectionChecker,
  });
  @override
  void cancelListening() {
    _subscription?.cancel();
  }

  @override
  void listen(Function(ConnectivityState state) onConnectionStatechange) {
    _subscription = connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        onConnectionStatechange(ConnectivityState.notConnected);
      } else {
        connectionChecker.isConnected().then((isConnected) {
          onConnectionStatechange(
            isConnected
                ? ConnectivityState.connected
                : ConnectivityState.notConnected,
          );
        });
      }
    });
  }
}
