import '../../data/datasource/movie_remote_data_source.dart';
import '../entities/movie.dart';

abstract class BaseMovieRepository {
  final BaseMovieRemoteDataSource remoteDataSource;

  BaseMovieRepository(this.remoteDataSource);
  
  Future<List<Movie>> getNowPlaying();
  Future<List<Movie>> getPopular();
  Future<List<Movie>> getTopRated();
}
