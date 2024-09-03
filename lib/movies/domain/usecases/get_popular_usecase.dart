import 'package:movies/movies/domain/repository/base_movie_repository.dart';

import '../entities/movie.dart';

class GetPopularUsecase{
  final BaseMovieRepository _moviesRepository;

  GetPopularUsecase(this._moviesRepository);

  Future<List<Movie>> execute() async {
    return await _moviesRepository.getPopular();
  }
}