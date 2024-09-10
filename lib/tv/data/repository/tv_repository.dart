import 'package:dartz/dartz.dart';

import 'package:movies/core/error/failure.dart';

import 'package:movies/tv/domain/entities/more_like_this.dart';

import 'package:movies/tv/domain/entities/tv_movie.dart';

import 'package:movies/tv/domain/entities/tv_movie_details.dart';

import 'package:movies/tv/domain/usecases/get_more_like_this_usecase.dart';

import 'package:movies/tv/domain/usecases/get_tv_movie_details_usecase.dart';

import '../../../core/error/exceptions.dart';
import '../../domain/repository/base_tv_repository.dart';
import '../datasource/tv_remote_data_source.dart';

class TvRepository extends BaseTvRepository {
  final BaseTvRemoteDataSource remoteDataSource;

  TvRepository(this.remoteDataSource);
  @override
  Future<Either<Failure, List<MoreLikeThis>>> getMoreLikeThis(
      MoreLikeThisParams parameters) async {
    final result = await remoteDataSource.getMoreLikeThis(parameters);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<TvMovie>>> getOnTheAir() async {
    final result = await remoteDataSource.getOnTheAirTVMovies();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<TvMovie>>> getPopular() async {
    final result = await remoteDataSource.getPopularTVMovies();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<TvMovie>>> getTopRated() async {
    final result = await remoteDataSource.getTopRatedTVMovies();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, TvMovieDetails>> getTvMovieDetails(
      TvMovieDetailsParams movieId) async {
    final result = await remoteDataSource.getTVMovieDetails(movieId);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
