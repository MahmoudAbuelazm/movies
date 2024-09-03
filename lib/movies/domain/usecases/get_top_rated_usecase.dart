import 'package:movies/movies/domain/repository/base_movie_repository.dart';

import '../entities/movie.dart';

class GetTopRatedUsecase {
  final BaseMovieRepository _moviesRepository;

  GetTopRatedUsecase(this._moviesRepository);

  Future<List<Movie>> execute() async {
    return await _moviesRepository.getTopRated();
  }
}
