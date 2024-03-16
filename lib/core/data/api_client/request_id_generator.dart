import 'package:uuid/uuid.dart';

abstract class RequestIdGenerator {
  String generate();
}

class RequestIdGeneratorImpl implements RequestIdGenerator {
  final Uuid _uuid;

  RequestIdGeneratorImpl({
    required Uuid uuid,
  }) : _uuid = uuid;
  @override
  String generate() {
    return _uuid.v1();
  }
}
