import 'package:dartz/dartz.dart';
import '../../../../_exports.dart';

abstract class IGetMoviesUsecase {
  Future<Either<MoviesException, PageMoviesEntity>> call({required int page});
}

class GetMoviesUsecasImpl implements IGetMoviesUsecase {
  final IJustMoviesRepository repository;

  GetMoviesUsecasImpl({
    required this.repository,
  });

  @override
  Future<Either<MoviesException, PageMoviesEntity>> call({required int page}) async {
    return await repository.getMovies(
      page: page,
    );
  }
}
