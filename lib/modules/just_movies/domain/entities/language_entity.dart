import 'package:equatable/equatable.dart';

class LanguageEntity extends Equatable {
  final String iso6391;
  final String name;

  const LanguageEntity({
    required this.iso6391,
    required this.name,
  });

  @override
  List<Object?> get props => [
        iso6391,
        name,
      ];
}
