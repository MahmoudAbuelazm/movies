import 'package:dio/dio.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/movies/data/models/movie_details_model.dart';
import 'package:movies/movies/data/models/movie_model.dart';
import 'package:movies/movies/data/models/recommendation_model.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';
import 'package:movies/movies/domain/usecases/get_movie_details_usecase.dart';

import '../../../core/network/api_constants.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain/usecases/get_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParams movieId);

  Future<List<Recommendation>> getRecommendation(
      RecommendationParams parameters);
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
  Future<List<MovieModel>> getPopularMovies() async {
    final respone = await Dio().get(ApiConstants.popular);

    if (respone.statusCode == 200) {
      return List<MovieModel>.from(
          (respone.data['results'] as List).map((x) => MovieModel.fromJson(x)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(respone.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final respone = await Dio().get(ApiConstants.topRated);

    if (respone.statusCode == 200) {
      return List<MovieModel>.from(
          (respone.data['results'] as List).map((x) => MovieModel.fromJson(x)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(respone.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParams movieId) async {
    final response =
        await Dio().get(ApiConstants.movieDetails(movieId.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParams parameters) async {
    final response =
        await Dio().get(ApiConstants.recommendationMovie(parameters.movieId));

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((x) => RecommendationModel.fromJson(x)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }
}
