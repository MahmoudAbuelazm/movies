import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constants.dart';
import '../../domain/entities/tv_movie.dart';
import 'tv_movie_detail_screen.dart';

class TvTopRatedScreen extends StatelessWidget {
  final List<TvMovie> tvShows ;
  const TvTopRatedScreen({super.key, required this.tvShows});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Tv Shows'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: tvShows.length,
          itemBuilder: (context, index) {
            final movie = tvShows[index];
            return TvMovieItem(movie: movie, index: index);
          },
        ),
      ),
    );
  }
}

class TvMovieItem extends StatelessWidget {
  const TvMovieItem({
    super.key,
    required this.movie,
    required this.index,
  });

  final TvMovie movie;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      delay: Duration(
        milliseconds: 50 * index,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TvMovieDetailScreen(
                id: movie.id,
              );
            }));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: CachedNetworkImage(
                      width: 100.0,
                      height: 140.0,
                      imageUrl: ApiConstants.imageUrl(movie.backdropPath),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Container(
                          width: 100.0,
                          height: 140.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 150,
                        height: 20.0,
                        child: Text(movie.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                            )),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 1.0,
                              horizontal: 4.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(
                              movie.releaseDate.split('-')[0],
                              style: const TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20.0,
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                (movie.voteAverage / 2).toStringAsFixed(1),
                                style: const TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                '(${movie.voteAverage})',
                                style: const TextStyle(
                                  fontSize: 1.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 150,
                        height: 60.0,
                        child: Flexible(
                          child: Text(
                            movie.overview,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
