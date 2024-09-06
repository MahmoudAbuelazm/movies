import 'package:get_it/get_it.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_usecase.dart';

import '../../movies/data/datasource/movie_remote_data_source.dart';
import '../../movies/data/repository/movies_repository.dart';
import '../../movies/presentation/controller/bloc/movies_bloc.dart';


final sl = GetIt.instance;

class ServicesLoactor {
  void init() {

    sl.registerFactory(() => MoviesBloc(sl()));
    // Use cases
    sl.registerLazySingleton(() => GetNowPlayingUsecase(sl()));

    // Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));

    // Data sources
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
