import 'package:get_it/get_it.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_usecase.dart';

import '../../movies/data/datasource/movie_remote_data_source.dart';
import '../../movies/data/repository/movies_repository.dart';
import '../../movies/domain/usecases/get_movie_details_usecase.dart';
import '../../movies/domain/usecases/get_popular_usecase.dart';
import '../../movies/domain/usecases/get_recommendation_usecase.dart';
import '../../movies/domain/usecases/get_top_rated_usecase.dart';
import '../../movies/presentation/controller/bloc/movie_details_bloc.dart';
import '../../movies/presentation/controller/bloc/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLoactor {
  void init() {
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerLazySingleton(() => MovieDetailsBloc(sl(), sl()));
    // Use cases
    sl.registerLazySingleton(() => GetNowPlayingUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularUsecase(sl()));
    sl.registerLazySingleton(() => GetTopRatedUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUsecase(sl()));

    // Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));

    // Data sources
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
