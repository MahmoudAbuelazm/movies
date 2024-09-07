import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constants.dart';
import '../../domain/entities/movie.dart';
import 'movie_detail_screen.dart';

class TopRatedScreen extends StatelessWidget {
  final List<Movie> movies;
  const TopRatedScreen({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.movie,
    required this.index,
  });

  final Movie movie;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      delay: Duration(
        milliseconds: 50 * index,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MovieDetailScreen(
              id: movie.id,
            );
          }));
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CachedNetworkImage(
                  imageUrl: ApiConstants.imageUrl(movie.backdropPath),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                      height: 170.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: 180.0,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      movie.releaseDate.substring(0, 4),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
