import 'dart:convert';
import '../../_exports.dart';

class LanguageModel extends LanguageEntity {
  const LanguageModel({
    required super.iso6391,
    required super.name,
  });

  factory LanguageModel.fromJson(String source) => LanguageModel.fromMap(json.decode(source));

  factory LanguageModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) throw Exception('Null map provided to LanguageModel.fromMap()');
    return LanguageModel(
      iso6391: map['iso_639_1'] ?? '',
      name: map['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'iso_639_1': iso6391,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());
}
