// coverage:ignore-file
import 'package:equatable/equatable.dart';
import '../../../../_exports.dart';

abstract class MovieDetailsState extends Equatable {}

class MovieDetailsLoadingState extends MovieDetailsState {
  @override
  List<Object?> get props => [];
}

class MovieDetailsSuccessState extends MovieDetailsState {
  final MovieDetailsEntity movie;

  MovieDetailsSuccessState({required this.movie});
  @override
  List<Object?> get props => [];
}

class MovieDetailsErrorState extends MovieDetailsState {
  final String message;

  MovieDetailsErrorState({required this.message});
  @override
  List<Object?> get props => [];
}
