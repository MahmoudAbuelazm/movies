import 'package:equatable/equatable.dart';

import 'tv_genres.dart';

class TvMovieDetails extends Equatable {
  final String backdropPath;
  final int id;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final num voteAverage;
  final List<TvGenres> genres;


  const TvMovieDetails(
      {required this.backdropPath,
      required this.id,
      required this.overview,
      required this.releaseDate,
      required this.runtime,
      required this.title,
      required this.voteAverage,
      required this.genres});
   

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        overview,
        releaseDate,
        runtime,
        title,
        voteAverage,
        genres
      ];


      
}
