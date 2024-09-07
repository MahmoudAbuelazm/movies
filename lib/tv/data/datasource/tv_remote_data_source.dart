import 'package:dio/dio.dart';
import 'package:movies/tv/domain/entities/more_like_this.dart';
import 'package:movies/tv/domain/usecases/get_more_like_this_usecase.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain/usecases/get_tv_movie_details_usecase.dart';
import '../models/tv_movie_details_model.dart';
import '../models/tv_movie_model.dart';

abstract class TvRemoteDataSource {
  Future<List<TvMovieModel>> getOnTheAirTVMovies();
  Future<List<TvMovieModel>> getPopularTVMovies();
  Future<List<TvMovieModel>> getTopRatedTVMovies();

  Future<TvMovieDetailsModel> getTVMovieDetails(TvMovieDetailsParams tvMovieId);

  Future<List<MoreLikeThis>> getMoreLikeThis(MoreLikeThisParams parameters);
}

class TVMovieRemoteDataSource extends TvRemoteDataSource {
  @override
  Future<List<TvMovieModel>> getOnTheAirTVMovies() {
    // TODO: implement getOnTheAirTVMovies
    throw UnimplementedError();
  }

  @override
  Future<List<TvMovieModel>> getPopularTVMovies() {
    // TODO: implement getPopularTVMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MoreLikeThis>> getMoreLikeThis(MoreLikeThisParams parameters) {
    // TODO: implement getMoreLikeThis
    throw UnimplementedError();
  }

  @override
  Future<TvMovieDetailsModel> getTVMovieDetails(
      TvMovieDetailsParams tvMovieId) async {
    final response =
        await Dio().get(ApiConstants.movieDetails(tvMovieId.movieId));

    if (response.statusCode == 200) {
      return TvMovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvMovieModel>> getTopRatedTVMovies() async {
    final respone = await Dio().get(ApiConstants.topRated);

    if (respone.statusCode == 200) {
      return List<TvMovieModel>.from((respone.data['results'] as List)
          .map((x) => TvMovieModel.fromJson(x)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(respone.data));
    }
  }
}
