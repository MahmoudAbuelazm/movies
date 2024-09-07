import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetTopRatedUsecase {
  final BaseMovieRepository _moviesRepository;

  GetTopRatedUsecase(this._moviesRepository);

  Future<Either<Failure, List<Movie>>>  call() async {
    return await _moviesRepository.getTopRated();
  }
}
