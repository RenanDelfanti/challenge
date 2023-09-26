import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:interfaces/interfaces.dart';
import '../../../../_exports.dart';

class MovieDetailsBindings extends IBindings {
  final int movieId;
  final String title;

  MovieDetailsBindings({required this.movieId, required this.title});

  @override
  void dependencies() {
    debugPrint('MovieDetailsBindings - dependencies');
    GetIt.I.registerLazySingleton<IGetMovieDetailsUsecase>(
      () => GetMovieDetailsUsecaseImpl(
        repository: GetIt.I<IJustMoviesRepository>(),
      ),
    );

    GetIt.I.registerLazySingleton(
      () => MovieDetailsController(
        usecase: GetIt.I<IGetMovieDetailsUsecase>(),
        movieId: movieId,
        title: title,
      ),
    );
  }

  @override
  void dispose() {
    debugPrint('MovieDetailsBindings - dispose');
    GetIt.I.unregister<IGetMovieDetailsUsecase>();
    GetIt.I.unregister<MovieDetailsController>();
  }
}
