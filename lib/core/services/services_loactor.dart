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
import '../../tv/data/datasource/tv_remote_data_source.dart';
import '../../tv/data/repository/tv_repository.dart';
import '../../tv/domain/repository/base_tv_repository.dart';
import '../../tv/domain/usecases/get_more_like_this_usecase.dart';
import '../../tv/domain/usecases/get_on_the_air_usecase.dart';
import '../../tv/domain/usecases/get_popular_tv_usecase.dart';
import '../../tv/domain/usecases/get_top_rated_tv_usecase.dart';
import '../../tv/domain/usecases/get_tv_movie_details_usecase.dart';
import '../../tv/presentation/controller/bloc/tv_details_bloc.dart';
import '../../tv/presentation/controller/tv_bloc/tv_bloc.dart';

final sl = GetIt.instance;

class ServicesLoactor {
  void init() {
    // Movies Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));
    // Use cases Movies
    sl.registerLazySingleton(() => GetNowPlayingUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularUsecase(sl()));
    sl.registerLazySingleton(() => GetTopRatedUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUsecase(sl()));

    // Repository Movies
    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));

    // Data sources
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    // TV Bloc
    sl.registerFactory(() => TvBloc(sl(), sl(), sl()));
    sl.registerFactory(() => TvDetailsBloc(sl(), sl()));

    // Use cases TV
    sl.registerLazySingleton(() => GetMoreLikeThisUsecase(sl()));
    sl.registerLazySingleton(() => GetTvMovieDetailsUsecase(sl()));
    sl.registerLazySingleton(() => GetTopRatedTvUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularTvUsecase(sl()));
    sl.registerLazySingleton(() => GetOnTheAirUsecase(sl()));

    // Repository TV
    sl.registerLazySingleton<BaseTvRepository>(() => TvRepository(sl()));

    // Data sources TV
    sl.registerLazySingleton<BaseTvRemoteDataSource>(
        () => TVRemoteDataSource());
  }
}
