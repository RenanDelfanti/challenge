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
            return const Center(
              child: Text('Error'),
            );
          } else if (state is HomeLoadingState && state.isFirstFetch) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<MovieEntity> movies = [];
          bool isLoading = false;
          if (state is HomeLoadingState) {
            movies = state.oldMovies;
            isLoading = true;
          } else if (state is HomeSuccessState) {
            movies = state.movies;
          }
          return GridView.count(
            padding: const EdgeInsets.all(16),
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.7,
            children: [
              for (final movie in movies)
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      RoutesImpl.details,
                      arguments: {
                        'id': movie.id,
                        'title': movie.title,
                      },
                    );
                  },
                  child: ImageWidget(
                    path: movie.posterPath,
                  ),
                ),
              if (isLoading) const Center(child: CircularProgressIndicator()),
              if (!isLoading)
                IconButton(
                  icon: const Icon(Icons.navigate_next_sharp),
                  onPressed: () {
                    GetIt.I<HomeController>().fetchNextPage();
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
