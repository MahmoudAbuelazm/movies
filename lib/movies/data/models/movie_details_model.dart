import 'package:movies/movies/domain/entities/movie_details.dart';

import 'genres_model.dart';

class MovieDetailsModel extends MovieDetails{
  const MovieDetailsModel({required super.backdropPath, required super.id, required super.overview, required super.releaseDate, required super.runtime, required super.title, required super.voteAverage, required super.genres});
 factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      title: json['title'],
      voteAverage: json['vote_average'],
      genres: List.from(json['genres'])
          .map((e) => GenresModel.fromJson(e))
          .toList(),
    );
  }
}