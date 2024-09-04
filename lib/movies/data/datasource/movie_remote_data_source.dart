import 'package:dio/dio.dart';
import 'package:movies/movies/data/models/movie_model.dart';

import '../../../core/utils/app_constants.dart';

class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final respone = await Dio().get(AppConstants.baseUrl);

    if (respone.statusCode == 200) {
      return respone.data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
