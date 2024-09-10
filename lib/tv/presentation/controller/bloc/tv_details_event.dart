part of 'tv_details_bloc.dart';

sealed class TvDetailsEvent extends Equatable {
  const TvDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetTvDetailsEvent extends TvDetailsEvent {
  final int tvId;

  const GetTvDetailsEvent(this.tvId);

  @override
  List<Object> get props => [tvId];
}

class GetSimilarTvEvent extends TvDetailsEvent {
  final int tvId;

  const GetSimilarTvEvent(this.tvId);

  @override
  List<Object> get props => [tvId];
}
