class Movie {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;

  Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          other.id == id &&
          other.title == title &&
          other.backdropPath == backdropPath &&
          other.genreIds == genreIds &&
          other.overview == overview &&
          other.voteAverage == voteAverage;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      backdropPath.hashCode ^
      genreIds.hashCode ^
      overview.hashCode ^
      voteAverage.hashCode;
}
