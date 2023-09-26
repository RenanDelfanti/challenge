import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../_exports.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(GetIt.I<MovieDetailsController>().title)),
        body: BlocBuilder<MovieDetailsController, MovieDetailsState>(
          bloc: GetIt.I<MovieDetailsController>(),
          builder: (context, state) {
            if (state is MovieDetailsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieDetailsSuccessState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ImageWidget(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          height: 300,
                          path: state.movie.backdropPath,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black,
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.movie.title,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  state.movie.releaseDate,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 16,
                          bottom: 16,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                  child: Text(
                                    '${((state.movie.voteAverage / 10) * 100).round()}%',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(
                                  value: state.movie.voteAverage / 10,
                                  backgroundColor: Colors.white,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        state.movie.overview,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Idiomas disponíveis',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.movie.languages.length,
                        itemBuilder: (context, index) {
                          final language = state.movie.languages[index];
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: Text(language.name),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is MovieDetailsErrorState) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ));
  }
}
