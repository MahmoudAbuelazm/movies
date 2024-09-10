import 'package:movies/tv/domain/entities/tv_movie_details.dart';

import '../../domain/entities/tv_genres.dart';

class TvMovieDetailsModel extends TvMovieDetails {
  const TvMovieDetailsModel(
      {required super.backdropPath,
      required super.id,
      required super.overview,
      required super.releaseDate,
      required super.runtime,
      required super.title,
      required super.voteAverage,
      required super.genres});
  factory TvMovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return TvMovieDetailsModel(
      backdropPath: json['backdrop_path'] ?? '',
      id: json['id'] ?? 0,
      overview: json['overview'] ?? '',
      releaseDate: json['first_air_date'] ?? '',
      runtime: (json['episode_run_time'] as List<dynamic>?)?.first ?? 0,
      title: json['original_name'] ?? '',
      voteAverage: json['vote_average'] ?? 0.0,
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => TvGenres.fromJson(e))
              .toList() ??
          [],
    );
  }
}
