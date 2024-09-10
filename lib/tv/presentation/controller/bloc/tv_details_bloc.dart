import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';

import '../../../domain/entities/more_like_this.dart';
import '../../../domain/entities/tv_movie_details.dart';
import '../../../domain/usecases/get_more_like_this_usecase.dart';
import '../../../domain/usecases/get_tv_movie_details_usecase.dart';

part 'tv_details_event.dart';
part 'tv_details_state.dart';

class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsState> {
  final GetTvMovieDetailsUsecase getTvDetailsUsecase;
  final GetMoreLikeThisUsecase getMoreLikeThisUsecase;

  TvDetailsBloc(
    this.getTvDetailsUsecase,
    this.getMoreLikeThisUsecase,
  ) : super(const TvDetailsState()) {
    on<GetTvDetailsEvent>((event, emit) async {
      final result = await getTvDetailsUsecase(
        TvMovieDetailsParams(event.tvId),
      );

      result.fold(
        (failure) => emit(state.copyWith(
            tvDetailsRequestState: RequestState.error,
            tvDetailsMessage: failure.message)),
        (tvDetails) => emit(
          state.copyWith(
            tvDetails: tvDetails,
            tvDetailsRequestState: RequestState.loaded,
          ),
        ),
      );
    });

    on<GetSimilarTvEvent>((event, emit) async {
      final result = await getMoreLikeThisUsecase(
        MoreLikeThisParams(event.tvId),
      );
      result.fold(
        (failure) => emit(state.copyWith(
            moreLikeThisRequestState: RequestState.error,
            moreLikeThisMessage: failure.message)),
        (moreLikeThis) => emit(
          state.copyWith(
            moreLikeThis: moreLikeThis,
            moreLikeThisRequestState: RequestState.loaded,
          ),
        ),
      );

    });
  }
}
