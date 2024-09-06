part of 'movies_bloc.dart';

 class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingrequestState;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final RequestState popularRequestState;
  final String popularMessage;

  const MoviesState({
    
    this.nowPlayingMovies = const [],
    this.nowPlayingrequestState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
    this.popularRequestState = RequestState.loading,
    this.popularMessage = '',
  });

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingrequestState,
        nowPlayingMessage,
        popularMovies,
        popularRequestState,
        popularMessage,
      ];
}

final class MoviesInitial extends MoviesState {}
