import 'package:dio/dio.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/movies/data/models/movie_model.dart';

import '../../../core/network/api_constants.dart';
import '../../../core/network/error_message_model.dart';

class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final respone = await Dio().get(ApiConstants.baseUrl);

    if (respone.statusCode == 200) {
      return List<MovieModel>.from(
          (respone.data['results'] as List).map((x) => MovieModel.fromJson(x)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(respone.data));
    }
  }
}
