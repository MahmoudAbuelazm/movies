import 'package:equatable/equatable.dart';

class TvMovie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final num voteAverage;
  final String releaseDate;

  const TvMovie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      backdropPath,
      genreIds,
      overview,
      voteAverage,
      releaseDate,
    ];
  }
}
