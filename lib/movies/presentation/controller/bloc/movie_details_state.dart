part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsrequestState;
  final String movieDetailsMessage;
  final List<Recommendation> recommendations;
  final RequestState recommendationRequestState;
  final String recommendationMessage;
  

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsrequestState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendations = const [],
    this.recommendationRequestState = RequestState.loading,
    this.recommendationMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsrequestState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendations,
    RequestState? recommendationRequestState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsrequestState: movieDetailsrequestState ?? this.movieDetailsrequestState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendations: recommendations ?? this.recommendations,
      recommendationRequestState: recommendationRequestState ?? this.recommendationRequestState,
      recommendationMessage: recommendationMessage ?? this.recommendationMessage,
    );
  }


@override
List<Object?> get props => [movieDetails, movieDetailsrequestState, movieDetailsMessage, recommendations, recommendationRequestState, recommendationMessage];
}
