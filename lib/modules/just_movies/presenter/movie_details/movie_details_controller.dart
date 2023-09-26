import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../_exports.dart';

class MovieDetailsController extends Cubit<MovieDetailsState> {
  MovieDetailsController({
    required this.usecase,
    required this.movieId,
    required this.title,
  }) : super(MovieDetailsLoadingState()) {
    fetchData();
  }

  final IGetMovieDetailsUsecase usecase;
  final int movieId;
  final String title;

  bool success = false;

  Future<void> fetchData() async {
    final result = await usecase(id: movieId);
    result.fold((failure) {
      emit(MovieDetailsErrorState(message: failure.toString()));
    }, (movie) {
      emit(MovieDetailsSuccessState(movie: movie));
    });
  }
}
