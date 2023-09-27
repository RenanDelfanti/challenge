import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:just_movies/_exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Just Popular Movies'), actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            GetIt.I<HomeController>().fetchData();
          },
        ),
      ]),
      body: BlocBuilder<HomeController, HomeState>(
        bloc: GetIt.I<HomeController>(),
        builder: (context, state) {
          if (state is HomeErrorState) {
            return const ErrorStatePage();
          } else if (state is HomeLoadingState && state.isFirstFetch) {
            return const LoadingStatePage();
          }
          List<MovieEntity> movies = [];
          bool isLoading = false;
          if (state is HomeLoadingState) {
            movies = state.oldMovies;
            isLoading = true;
          } else if (state is HomeSuccessState) {
            movies = state.movies;
          }
          return HomeSuccessStatePage(
            isLoading: isLoading,
            movies: movies,
          );
        },
      ),
    );
  }
}
