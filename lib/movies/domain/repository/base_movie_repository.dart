import '../../data/datasource/movie_remote_data_source.dart';
import '../entities/movie.dart';

abstract class BaseMovieRepository {

  
  Future<List<Movie>> getNowPlaying();
  Future<List<Movie>> getPopular();
  Future<List<Movie>> getTopRated();
}
