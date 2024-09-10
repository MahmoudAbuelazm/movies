part of 'tv_bloc.dart';

 class TvState extends Equatable {
  final List<TvMovie> onTheAirTvShows;
  final RequestState onTheAirRequestState;
  final String onTheAirMessage;
  final List<TvMovie> popularTvShows;
  
  final RequestState popularRequestState;
  final String popularMessage;
  final List<TvMovie> topRatedTvShows;
  final RequestState topRatedRequestState;
  final String topRatedMessage;

  const TvState({
    this.onTheAirTvShows = const [],
    this.onTheAirRequestState = RequestState.loading,
    this.onTheAirMessage = '',
    this.popularTvShows = const [],
    this.popularRequestState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedTvShows = const [],
    this.topRatedRequestState = RequestState.loading,
    this.topRatedMessage = '',
  });
  
  


  TvState copyWith ({
    List<TvMovie>? onTheAirTvShows,
    RequestState? onTheAirRequestState,
    String? onTheAirMessage,
    List<TvMovie>? popularTvShows,
    RequestState? popularRequestState,
    String? popularMessage,
    List<TvMovie>? topRatedTvShows,
    RequestState? topRatedRequestState,
    String? topRatedMessage,
  }) {
    return TvState(
      onTheAirTvShows: onTheAirTvShows ?? this.onTheAirTvShows,
      onTheAirRequestState: onTheAirRequestState ?? this.onTheAirRequestState,
      onTheAirMessage: onTheAirMessage ?? this.onTheAirMessage,
      popularTvShows: popularTvShows ?? this.popularTvShows,
      popularRequestState: popularRequestState ?? this.popularRequestState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedTvShows: topRatedTvShows ?? this.topRatedTvShows,
      topRatedRequestState: topRatedRequestState ?? this.topRatedRequestState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }
    
  
  @override
  List<Object> get props => [
    onTheAirTvShows,
    onTheAirRequestState,
    onTheAirMessage,
    popularTvShows,
    popularRequestState,
    popularMessage,
    topRatedTvShows,
    topRatedRequestState,
    topRatedMessage,
  ];
}


