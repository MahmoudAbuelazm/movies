import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../usecases/get_movie_details_usecase.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlaying();
  Future<Either<Failure, List<Movie>>> getPopular();
  Future<Either<Failure, List<Movie>>> getTopRated();

  Future<Either<Failure, MovieDetails>> getMovieDetails(GetMovieDetailsParams movieId);
}
