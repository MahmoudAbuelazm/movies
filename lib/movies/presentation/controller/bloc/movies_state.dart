part of 'movies_bloc.dart';

 class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingrequestState;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final RequestState popularRequestState;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedRequestState;

  const MoviesState({
    
    this.nowPlayingMovies = const [],
    this.nowPlayingrequestState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
    this.popularRequestState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRatedRequestState = RequestState.loading,
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingrequestState,
    String? nowPlayingMessage,
    List<Movie>? popularMovies,
    RequestState? popularRequestState,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedRequestState,

  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingrequestState: nowPlayingrequestState ?? this.nowPlayingrequestState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularRequestState: popularRequestState ?? this.popularRequestState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedRequestState: topRatedRequestState ?? this.topRatedRequestState,

    );
  }

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingrequestState,
        nowPlayingMessage,
        popularMovies,
        popularRequestState,
        popularMessage,
        topRatedMovies,
        topRatedRequestState,
      ];
}

final class MoviesInitial extends MoviesState {}
