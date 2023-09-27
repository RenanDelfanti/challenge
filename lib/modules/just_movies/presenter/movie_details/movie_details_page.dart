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
            return const LoadingStatePage();
          } else if (state is MovieDetailsErrorState) {
            return const ErrorStatePage();
          } else {
            return MovieDetailsSuccessStatePage(state: state as MovieDetailsSuccessState);
          }
        },
      ),
    );
  }
}
