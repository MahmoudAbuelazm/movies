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
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies.reversed.toList()[index];
          return MovieItem(movie: movie, index: index);
        },
      ),
    );
  }
}
