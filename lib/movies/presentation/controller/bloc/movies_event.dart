part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class GetNowPlayingMovies extends MoviesEvent {
  const GetNowPlayingMovies();
}

class GetPopularMovies extends MoviesEvent {
  const GetPopularMovies();
}

class GetTopRatedMovies extends MoviesEvent {
  const GetTopRatedMovies();
}
