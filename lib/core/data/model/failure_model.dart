import 'dart:convert';

class FailureModel {
  final String message;

  FailureModel(this.message);

  factory FailureModel.fromMap(String response) {
    late Map<String, dynamic> map;
    try {
      map = json.decode(response) as Map<String, dynamic>;
    } on Exception catch (_) {
      return FailureModel('No failure message is attached');
    }
    if (map.containsKey('message')) {
      return FailureModel(map['message'].toString());
    } else if (map.containsKey('errorMessage')) {
      return FailureModel(map['errorMessage'].toString());
    } else if (map.containsKey('error')) {
      return FailureModel(map['error'].toString());
    }
    return FailureModel('No failure message is attached');
  }
}
