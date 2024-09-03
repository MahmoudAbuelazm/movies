import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

class GetNowPlayingUsecase {
  final BaseMovieRepository _repository;

  GetNowPlayingUsecase(this._repository);

  Future<List<Movie>> excute() async {
    return await _repository.getNowPlaying();
  }
}
