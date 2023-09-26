import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../_exports.dart';

class HomeController extends Cubit<HomeState> {
  HomeController({required this.usecase})
      : super(HomeLoadingState(
          oldMovies: const [],
          isFirstFetch: true,
        )) {
    fetchData();
  }

  final IGetMoviesUsecase usecase;
  int page = 1;
  late List<MovieEntity> movies = [];

  Future<void> fetchData({int page = 1}) async {
    emit(HomeLoadingState(
      oldMovies: movies,
      isFirstFetch: page == 1,
    ));
    page = 1;
    var result = await usecase(page: page);
    result.fold((failure) => emit(HomeErrorState()), (page) {
      movies.clear();
      movies.addAll(page.movies);
      emit(HomeSuccessState(movies: movies));
    });
  }

  Future<void> fetchNextPage() async {
    page++;
    emit(HomeLoadingState(
      oldMovies: movies,
      isFirstFetch: page == 1,
    ));
    var result = await usecase(page: page);
    result.fold((failure) => emit(HomeErrorState()), (page) {
      movies.addAll(page.movies);
      emit(HomeSuccessState(movies: movies));
    });
  }
}
