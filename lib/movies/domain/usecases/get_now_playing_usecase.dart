import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingUsecase {
  final BaseMovieRepository _repository;

  GetNowPlayingUsecase(this._repository);

  Future<Either<Failure, List<Movie>>>  excute() async {
    return await _repository.getNowPlaying();
  }
}
