import 'package:dio/dio.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/movies/data/models/movie_model.dart';

import '../../../core/network/api_constants.dart';
import '../../../core/network/error_message_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final respone = await Dio().get(ApiConstants.nowPlaying);

    if (respone.statusCode == 200) {
      return List<MovieModel>.from(
          (respone.data['results'] as List).map((x) => MovieModel.fromJson(x)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(respone.data));
    }
  }
  
  @override
  Future<List<MovieModel>> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }
}
