import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@Freezed()
class Failure with _$Failure {
  /// User  sees there is no internet
  const factory Failure.noInternet() = _FailureNoInternet;

  /// User sees server is taking too long to respond
  const factory Failure.serverTimeout() = _FailureServerTimeout;

  /// User sees server is taking too long to respond
  const factory Failure.serverUnavailable() = _FailureServerUnavailable;

  /// User sees the service is currently unavailable
  const factory Failure.serverFailed() = _FailureServerFailed;

  /// User sees
  const factory Failure.parsing() = _FailureParsing;

  /// User could not be authorized even after refreshing token; User gets a popup to go to login page
  const factory Failure.authorization() = _FailureAuthorization;

  /// Unhandled
  const factory Failure.unHandled() = _FailureUnhandled;
}
