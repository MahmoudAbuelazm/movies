part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState requestState;
  final String nowPlayingMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.requestState = RequestState.loading,
    this.nowPlayingMessage = '',
  });

  @override
  List<Object> get props => [nowPlayingMovies, requestState, nowPlayingMessage];
}

final class MoviesInitial extends MoviesState {}
