import '../entities/movie.dart';

abstract class BaseMovieRepository {
  Future<List<Movie>>getNowPlaying();
  Future<List<Movie>>getPopular();
}