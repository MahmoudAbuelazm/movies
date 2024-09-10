import '../../domain/entities/tv_movie.dart';

class TvMovieModel extends TvMovie {
  const TvMovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory TvMovieModel.fromJson(Map<String, dynamic> json) => TvMovieModel(
        id: json['id'],
        title: json['name'],
        backdropPath: json['backdrop_path'],
        genreIds: List.from(json['genre_ids']).map((e) => e as int).toList(),
        overview: json['overview'],
        voteAverage: json['vote_average'],
        releaseDate: json['first_air_date'],
      );
}
