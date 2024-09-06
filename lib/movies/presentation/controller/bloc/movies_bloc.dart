import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_usecase.dart';

import '../../../domain/entities/movie.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
 final GetNowPlayingUsecase getNowPlayingUsecase;

  MoviesBloc(
    this.getNowPlayingUsecase
  ) : super(const MoviesState()) {
    on<GetNowPlayingMovies>((event, emit) async {
      
      final result = await getNowPlayingUsecase.excute();
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
