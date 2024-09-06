import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_usecase.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_popular_usecase.dart';
import '../../../domain/usecases/get_top_rated_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUsecase getNowPlayingUsecase;
  final GetPopularUsecase getPopularMoviesUsecase;
  final GetTopRatedUsecase getTopRatedMoviesUsecase;

  MoviesBloc(
    this.getNowPlayingUsecase,
    this.getPopularMoviesUsecase,
    this.getTopRatedMoviesUsecase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMovies>((event, emit) async {
      final result = await getNowPlayingUsecase.excute();
      result.fold(
        (failure) =>
            emit(state.copyWith(nowPlayingrequestState: RequestState.error)),
        (movies) => emit(
          state.copyWith(
            nowPlayingMovies: movies,
            nowPlayingrequestState: RequestState.loaded,
          ),
        ),
      );
    });

    on<GetPopularMovies>((event, emit) async {
      final result = await getPopularMoviesUsecase.execute();
      result.fold(
        (failure) =>
            emit(state.copyWith(popularRequestState: RequestState.error)),
        (movies) => emit(
          state.copyWith(
            popularMovies: movies,
            popularRequestState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
