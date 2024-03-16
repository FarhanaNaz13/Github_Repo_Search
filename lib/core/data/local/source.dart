import 'dart:developer';

import 'package:github_treasures/core/data/mapper/mapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Source<T> {
  String get key;
  Future<void> save(T value);
  T get();
}

abstract class SourceImpl<T> implements Source<T> {
  final Mapper<T, String> toStringMapper;
  final Mapper<String, T> fromStringMapper;
  final SharedPreferences _sharedPreferences;

  SourceImpl({
    required this.toStringMapper,
    required this.fromStringMapper,
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  T get() {
    final value = _sharedPreferences.getString(key) ?? '';
    log('Getting from Source: $value');
    return fromStringMapper.map(value);
  }

  @override
  Future<void> save(T value) async {
    log('Saving to Source:\n $key: $value');
    await _sharedPreferences.setString(
      key,
      toStringMapper.map(value),
    );
  }
}
