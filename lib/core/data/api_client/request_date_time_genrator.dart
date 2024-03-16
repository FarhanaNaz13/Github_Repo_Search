abstract class RequestDateTimeStringGenerator {
  String generate();
}

class RequestDateTimeStringGeneratorImpl
    implements RequestDateTimeStringGenerator {
  @override
  String generate() {
    return '${DateTime.now().toIso8601String()}Z';
  }
}
