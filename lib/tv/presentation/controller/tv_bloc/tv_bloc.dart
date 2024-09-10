import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/base_use_case.dart';
import '../../../../core/utils/enums.dart';
import '../../../domain/entities/tv_movie.dart';
import '../../../domain/usecases/get_on_the_air_usecase.dart';
import '../../../domain/usecases/get_popular_tv_usecase.dart';
import '../../../domain/usecases/get_top_rated_tv_usecase.dart';

part 'tv_event.dart';
part 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  final GetOnTheAirUsecase getOnTheAirUsecase;
  final GetPopularTvUsecase getPopularUsecase;
  final GetTopRatedTvUsecase getTopRatedUsecase;

  TvBloc(
    this.getOnTheAirUsecase,
    this.getPopularUsecase,
    this.getTopRatedUsecase,
  ) : super(const TvState()) {
    on<GetOnTheAirTv>((event, emit) async {
      final result = await getOnTheAirUsecase(NoParams());
      
      result.fold(
        (failure) =>
            emit(state.copyWith(onTheAirRequestState: RequestState.error)),
        (tvShows) => emit(
          state.copyWith(
            onTheAirTvShows: tvShows,
            onTheAirRequestState: RequestState.loaded,
          ),
        ),
      );
    });
    on<GetPopularTv>((event, emit) async {
      final result = await getPopularUsecase(NoParams());
      result.fold(
        (failure) =>
            emit(state.copyWith(popularRequestState: RequestState.error)),
        (tvShows) => emit(
          state.copyWith(
            popularTvShows: tvShows,
            popularRequestState: RequestState.loaded,
          ),
        ),
      );
    });
    on<GetTopRatedTv>((event, emit) async {
      final result = await getTopRatedUsecase(NoParams());
      result.fold(
        (failure) =>
            emit(state.copyWith(topRatedRequestState: RequestState.error)),
        (tvShows) => emit(
          state.copyWith(
            topRatedTvShows: tvShows,
            topRatedRequestState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
