import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/domain/usecases/get_movie_details_usecase.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/entities/movie_details.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  MovieDetailsBloc(
    this.getMovieDetailsUsecase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      final result = await getMovieDetailsUsecase(
        MovieDetailsParams(event.movieId),
      );

      result.fold(
        (failure) => emit(state.copyWith(
            movieDetailsrequestState: RequestState.error,
            movieDetailsMessage: failure.message)),
        (movieDetails) => emit(
          state.copyWith(
            movieDetails: movieDetails,
            movieDetailsrequestState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
