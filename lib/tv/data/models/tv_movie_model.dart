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
        id: json['id'] ?? 0,
        title: json['name'] ?? "",
        backdropPath:
            json['backdrop_path'] ?? "/nlLKuyFz6lI0KyiY1V1AE2GwGX9.jpg",
        genreIds: List.from(json['genre_ids']).map((e) => e as int).toList(),
        overview: json['overview'] ?? "",
        voteAverage: json['vote_average'] ?? 0.0,
        releaseDate: json['first_air_date'] ?? '',
      );
}
