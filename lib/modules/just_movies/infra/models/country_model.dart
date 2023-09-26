import 'dart:convert';
import '../../_exports.dart';

class CountryModel extends CountryEntity {
  const CountryModel({
    required super.iso31661,
    required super.name,
  });

  factory CountryModel.fromJson(String source) => CountryModel.fromMap(json.decode(source));

  factory CountryModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) throw Exception('Null map provided to CountryModel.fromMap()');
    return CountryModel(
      iso31661: map['iso_3166_1'] ?? '',
      name: map['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'iso_3166_1': iso31661,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());
}
