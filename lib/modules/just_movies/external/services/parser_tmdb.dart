import 'package:flutter/foundation.dart';
import '../../../../_exports.dart';

MovieDetailsModel _getMovieDetailsFromMap(Map<String, dynamic> map) {
  return MovieDetailsModel.fromMap(map);
}

PageMoviesModel _getMoviesFromMap(Map<String, dynamic> map) {
  return PageMoviesModel.fromMap(map);
}

Future<MovieDetailsModel> parseMovieDetails(Map<String, dynamic> map) async {
  var parsed = await compute(_getMovieDetailsFromMap, map);
  return parsed;
}

Future<PageMoviesModel> parseMovies(Map<String, dynamic> map) async {
  var parsed = await compute(_getMoviesFromMap, map);
  return parsed;
}
