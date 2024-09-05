import 'package:dio/dio.dart';
import 'package:movies/core/error/exception.dart';
import 'package:movies/movies/data/models/movie_model.dart';

import '../../../core/network/error_message_model.dart';
import '../../../core/utils/app_constants.dart';

class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final respone = await Dio().get(AppConstants.baseUrl);

    if (respone.statusCode == 200) {
      return List<MovieModel>.from(
          (respone.data['results'] as List).map((x) => MovieModel.fromJson(x)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(respone.data));
    }
  }
}
