import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../../../../_exports.dart';

class HomeSuccessStatePage extends StatelessWidget {
  const HomeSuccessStatePage({super.key, required this.movies, required this.isLoading});
  final List<MovieEntity> movies;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: MediaQuery.of(context).size.width > 700 ? 5 : 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 0.7,
      children: [
        for (final movie in movies)
          GestureDetector(
            onTap: () {
              context.goNamed(
                RouterImpl.details,
                queryParameters: {
                  'id': movie.id.toString(),
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
  }
}
