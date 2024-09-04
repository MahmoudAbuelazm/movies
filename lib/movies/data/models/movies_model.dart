import 'package:movies/movies/domain/entities/movie.dart';

class MoviesModel extends Movie {
  const MoviesModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.genreIds,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate});
}
