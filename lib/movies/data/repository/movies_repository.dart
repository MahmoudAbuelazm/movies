import 'package:movies/movies/domain/entities/movie.dart';

import '../../domain/repository/base_movie_repository.dart';

class MoviesRepository extends BaseMovieRepository{
  @override
  Future<List<Movie>> getNowPlaying() {
    // TODO: implement getNowPlaying
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getPopular() {
    // TODO: implement getPopular
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getTopRated() {
    // TODO: implement getTopRated
    throw UnimplementedError();
  }
}