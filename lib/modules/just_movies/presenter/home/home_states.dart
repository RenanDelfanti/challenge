// coverage:ignore-file
import 'package:equatable/equatable.dart';
import '../../../../_exports.dart';

abstract class HomeState extends Equatable {}

class HomeLoadingState extends HomeState {
  final List<MovieEntity> oldMovies;
  final bool isFirstFetch;

  HomeLoadingState({required this.oldMovies, required this.isFirstFetch});
  @override
  List<Object?> get props => [];
}

class HomeSuccessState extends HomeState {
  final List<MovieEntity> movies;

  HomeSuccessState({required this.movies});
  @override
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  @override
  List<Object?> get props => [];
}
