abstract class RemoteKeys {
  static const kKeyOfAuth = 'Authorization';
  static const kPrefixOfToken = 'Bearer' ' ';
  static const kRequestId = 'request-id';
  static const kRequestTime = 'request-time';
  static final preLoginHeader = {
    'content-type': 'application/json',
    'accept': 'application/json',
    // 'request-timeout-in-seconds': '30',
    // 'version': 'dhsb', //TODO
  };
}
