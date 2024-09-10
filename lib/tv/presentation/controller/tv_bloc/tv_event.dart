part of 'tv_bloc.dart';

abstract class TvEvent extends Equatable {
  const TvEvent();

  @override
  List<Object> get props => [];
}

class GetOnTheAirTv extends TvEvent {
  const GetOnTheAirTv();
}

class GetPopularTv extends TvEvent {
  const GetPopularTv();
}

class GetTopRatedTv extends TvEvent {
  const GetTopRatedTv();
}

