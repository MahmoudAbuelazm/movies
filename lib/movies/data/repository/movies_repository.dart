import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';
import 'package:movies/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies/movies/domain/usecases/get_recommendation_usecase.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../domain/repository/base_movie_repository.dart';
import '../datasource/movie_remote_data_source.dart';

class MoviesRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource remoteDataSource;

  MoviesRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    final result = await remoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopular() async {
    final result = await remoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRated() async {
    final result = await remoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParams movieId) async {
    final result = await remoteDataSource.getMovieDetails(movieId);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParams parameters) async {
    final result = await remoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
