import 'dart:convert';
import '../../_exports.dart';

class CompanyModel extends CompanyEntity {
  const CompanyModel({
    required super.id,
    required super.logoPath,
    required super.name,
    required super.originCountry,
  });

  factory CompanyModel.fromJson(String source) => CompanyModel.fromMap(json.decode(source));

  factory CompanyModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) throw Exception('Null map provided to CompanyModel.fromMap()');
    return CompanyModel(
      id: map['id'] ?? 0,
      logoPath: map['logo_path'] ?? '',
      name: map['name'] ?? '',
      originCountry: map['origin_country'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'logo_path': logoPath,
      'name': name,
      'origin_country': originCountry,
    };
  }

  String toJson() => json.encode(toMap());
}
