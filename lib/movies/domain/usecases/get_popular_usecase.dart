import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_use_case.dart';
import '../entities/movie.dart';

class GetPopularUsecase extends BaseUseCase {
  final BaseMovieRepository _moviesRepository;

  GetPopularUsecase(this._moviesRepository);

  @override
  Future<Either<Failure, List<Movie>>>  call() async {
    return await _moviesRepository.getPopular();
  }
}