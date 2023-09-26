import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String iso31661;
  final String name;

  const CountryEntity({
    required this.iso31661,
    required this.name,
  });

  @override
  List<Object?> get props => [
        iso31661,
        name,
      ];
}
