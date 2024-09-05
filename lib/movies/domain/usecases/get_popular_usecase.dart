import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetPopularUsecase{
  final BaseMovieRepository _moviesRepository;

  GetPopularUsecase(this._moviesRepository);

  Future<Either<Failure, List<Movie>>>  execute() async {
    return await _moviesRepository.getPopular();
  }
}