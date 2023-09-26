import 'package:dartz/dartz.dart';
import '../../../../_exports.dart';

abstract class IGetMovieDetailsUsecase {
  Future<Either<MoviesException, MovieDetailsEntity>> call({required int id});
}

class GetMovieDetailsUsecaseImpl implements IGetMovieDetailsUsecase {
  final IJustMoviesRepository repository;

  GetMovieDetailsUsecaseImpl({
    required this.repository,
  });

  @override
  Future<Either<MoviesException, MovieDetailsEntity>> call({required int id}) async {
    return await repository.getMovieDetails(
      id: id,
    );
  }
}
