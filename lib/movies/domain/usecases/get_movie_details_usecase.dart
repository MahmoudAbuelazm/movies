import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_use_case.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUsecase
    extends BaseUseCase<MovieDetails, MovieDetailsParams> {
  final BaseMovieRepository _moviesRepository;

  GetMovieDetailsUsecase(this._moviesRepository);
  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParams parameters) async {
    return await _moviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParams extends Equatable {
  final int movieId;

  const MovieDetailsParams(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
