import 'package:flutter/material.dart';

import '../../domain/entities/tv_movie.dart';
import 'tv_top_rated_screen.dart';

class TvPopularScreen extends StatelessWidget {
  final List<TvMovie> movies;
  const TvPopularScreen({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Populer Tv Shows'),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return TvMovieItem(movie: movie, index: index);
        },
      ),
    );
  }
}
