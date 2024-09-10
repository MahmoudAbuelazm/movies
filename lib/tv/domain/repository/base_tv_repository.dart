import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/more_like_this.dart';
import '../entities/tv_movie.dart';
import '../entities/tv_movie_details.dart';
import '../usecases/get_more_like_this_usecase.dart';
import '../usecases/get_tv_movie_details_usecase.dart';

abstract class BaseTvRepository{

  Future<Either<Failure, List<TvMovie>>> getOnTheAir();
  Future<Either<Failure, List<TvMovie>>> getPopular();
  Future<Either<Failure, List<TvMovie>>> getTopRated();

  Future<Either<Failure, TvMovieDetails>> getTvMovieDetails(
      TvMovieDetailsParams movieId);
  Future<Either<Failure, List< MoreLikeThis>>> getMoreLikeThis(
      MoreLikeThisParams parameters);
}