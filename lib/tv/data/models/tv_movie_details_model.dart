
import 'package:movies/tv/domain/entities/tv_movie_details.dart';

import '../../domain/entities/tv_genres.dart';

class TvMovieDetailsModel extends TvMovieDetails{
  const TvMovieDetailsModel({required super.backdropPath, required super.id, required super.overview, required super.releaseDate, required super.runtime, required super.title, required super.voteAverage, required super.genres});
 factory TvMovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return TvMovieDetailsModel(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      title: json['title'],
      voteAverage: json['vote_average'],
      genres: List.from(json['genres'])
          .map((e) => TvGenres.fromJson(e))
          .toList(),
    );
  }
}