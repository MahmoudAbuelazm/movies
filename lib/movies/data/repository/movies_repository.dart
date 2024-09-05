import 'package:movies/movies/domain/entities/movie.dart';

import '../../domain/repository/base_movie_repository.dart';
import '../datasource/movie_remote_data_source.dart';

class MoviesRepository extends BaseMovieRepository{
  
  final BaseMovieRemoteDataSource remoteDataSource;

  MoviesRepository(this.remoteDataSource);

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