
import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';
import 'top_rated_screen.dart';

class PopulerScreen extends StatelessWidget {
  final List<Movie> movies;
  const PopulerScreen({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Populer Movies'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return MovieItem(movie: movie, index: index);
        },
      ),
    );
  }
}
