
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/tv/domain/entities/tv_movie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/network/api_constants.dart';


class ListViewItem extends StatelessWidget {
  final int index;
  final TvMovie movie;
  const ListViewItem({
    super.key,
    required this.index,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      delay: Duration(milliseconds: index * 100),
      child: Container(
        padding: const EdgeInsets.only(right: 8.0),
        child: InkWell(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return MovieDetailScreen(
            //     id: movie.id,
            //   );
            // }));
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            child: CachedNetworkImage(
              width: 120.0,
              fit: BoxFit.cover,
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
            ),
          ),
        ),
      ),
    );
  }
}
