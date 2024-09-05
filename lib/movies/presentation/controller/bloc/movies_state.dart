part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState requestState;
  final String message;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.requestState = RequestState.loading,
    this.message = '',
  });

  @override
  List<Object> get props => [nowPlayingMovies, requestState, message];
}

final class MoviesInitial extends MoviesState {}
