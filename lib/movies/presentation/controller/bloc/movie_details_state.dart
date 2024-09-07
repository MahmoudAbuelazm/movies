part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsrequestState;
  final String movieDetailsMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsrequestState = RequestState.loading,
    this.movieDetailsMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsrequestState,
    String? movieDetailsMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsrequestState: movieDetailsrequestState ?? this.movieDetailsrequestState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
    );
  }

  @override
  List<Object?> get props =>
      [movieDetails, movieDetailsrequestState, movieDetailsMessage];
}
