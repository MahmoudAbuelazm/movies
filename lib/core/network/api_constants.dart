class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'dd88e873f4f14dd67463c2e6fd267ae8';

  static const String nowPlaying = '$baseUrl/movie/now_playing?api_key=$apiKey';

  static const String popular = '$baseUrl/movie/popular?api_key=$apiKey';

  static const String topRated = '$baseUrl/movie/top_rated?api_key=$apiKey';

  static const String topRatedTv = '$baseUrl/tv/top_rated?api_key=$apiKey';

  static const String popularTv = '$baseUrl/tv/popular?api_key=$apiKey';

  static const String onTheAir = '$baseUrl/tv/on_the_air?api_key=$apiKey';

  static  String episodeGroup (int tvId) => '$baseUrl/tv/episode_group/$tvId?api_key=$apiKey';

  static String getListOfSeasons(int tvId) => '$baseUrl/tv/$tvId/episode_groups?api_key=$apiKey';

  static String movieDetails(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';

  static String tvDetails(int tvId) => '$baseUrl/tv/$tvId?api_key=$apiKey';

  static String recommendationMovie(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';

  static String recommendationTv(int tvId) =>
      '$baseUrl/tv/$tvId/recommendations?api_key=$apiKey';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
