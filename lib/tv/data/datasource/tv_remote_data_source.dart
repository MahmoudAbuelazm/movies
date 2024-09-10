import 'package:dio/dio.dart';
import 'package:movies/tv/data/models/more_like_this_model.dart';
import 'package:movies/tv/domain/entities/more_like_this.dart';
import 'package:movies/tv/domain/usecases/get_more_like_this_usecase.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain/usecases/get_tv_movie_details_usecase.dart';
import '../models/tv_movie_details_model.dart';
import '../models/tv_movie_model.dart';

abstract class BaseTvRemoteDataSource {
  Future<List<TvMovieModel>> getOnTheAirTVMovies();
  Future<List<TvMovieModel>> getPopularTVMovies();
  Future<List<TvMovieModel>> getTopRatedTVMovies();

  Future<TvMovieDetailsModel> getTVMovieDetails(TvMovieDetailsParams tvMovieId);

  Future<List<MoreLikeThis>> getMoreLikeThis(MoreLikeThisParams parameters);
}

class TVRemoteDataSource extends BaseTvRemoteDataSource {
  @override
  Future<List<TvMovieModel>> getOnTheAirTVMovies() async {
    final respone = await Dio().get(ApiConstants.onTheAir);

    if (respone.statusCode == 200) {
      return List<TvMovieModel>.from((respone.data['results'] as List)
          .map((x) => TvMovieModel.fromJson(x)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(respone.data));
    }
  }

  @override
  Future<List<MoreLikeThis>> getMoreLikeThis(
      MoreLikeThisParams parameters) async {
    final response =
        await Dio().get(ApiConstants.recommendationTv(parameters.movieId));

    if (response.statusCode == 200) {
      return List<MoreLikeThis>.from((response.data['results'] as List)
          .map((x) => MoreLikeThisModel.fromJson(x)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<TvMovieDetailsModel> getTVMovieDetails(
      TvMovieDetailsParams tvMovieId) async {
    final response = await Dio().get(ApiConstants.tvDetails(tvMovieId.movieId));

    if (response.statusCode == 200) {
      return TvMovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvMovieModel>> getTopRatedTVMovies() async {
    final respone = await Dio().get(ApiConstants.topRatedTv);

    if (respone.statusCode == 200) {
      return List<TvMovieModel>.from((respone.data['results'] as List)
          .map((x) => TvMovieModel.fromJson(x)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(respone.data));
    }
  }

  @override
  Future<List<TvMovieModel>> getPopularTVMovies() async {
    final respone = await Dio().get(ApiConstants.popularTv);

    if (respone.statusCode == 200) {
      return List<TvMovieModel>.from((respone.data['results'] as List)
          .map((x) => TvMovieModel.fromJson(x)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(respone.data));
    }
  }
}
