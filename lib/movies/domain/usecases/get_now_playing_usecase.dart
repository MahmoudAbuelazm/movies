import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_use_case.dart';

class GetNowPlayingUsecase extends BaseUseCase {
  final BaseMovieRepository _repository;

  GetNowPlayingUsecase(this._repository);

  @override
  Future<Either<Failure, List<Movie>>>  call() async {
    return await _repository.getNowPlaying();
  }
}
