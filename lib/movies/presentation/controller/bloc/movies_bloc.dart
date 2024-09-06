import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_usecase.dart';

import '../../../data/repository/movies_repository.dart';
import '../../../domain/entities/movie.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(const MoviesState()) {
    on<GetNowPlayingMovies>((event, emit) async {
      BaseMovieRemoteDataSource movieRemoteDataSource = MovieRemoteDataSource();
      BaseMovieRepository movieRepository =
          MoviesRepository(movieRemoteDataSource);
      final result = await GetNowPlayingUsecase(movieRepository).excute();
      result.fold(
        (failure) => emit(const MoviesState(requestState: RequestState.error)),
        (movies) => emit(
          MoviesState(
            nowPlayingMovies: movies,
            requestState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
