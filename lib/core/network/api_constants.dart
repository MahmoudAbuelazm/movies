

class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'dd88e873f4f14dd67463c2e6fd267ae8';

  static const String nowPlaying = '$baseUrl/movie/now_playing?api_key=$apiKey';

  static const String popular = '$baseUrl/movie/popular?api_key=$apiKey';

  static const String topRated = '$baseUrl/movie/top_rated?api_key=$apiKey';

  static String movieDetails(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';

  static String recommendation(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
