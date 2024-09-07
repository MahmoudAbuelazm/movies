import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constants.dart';
import '../../../core/utils/app_string.dart';
import '../screens/movie_detail_screen.dart';
import '../screens/populer_screen.dart';
import 'see_more_container.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.popularMovies != current.popularMovies,
      builder: (context, state) {
        return Column(
          children: [
            SeeMoreContainer(
              text: AppString.popular,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PopulerScreen(
                    movies: state.popularMovies,
                  );
                }));
              },
            ),
            FadeIn(
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MovieDetailScreen(
                                id: state.popularMovies[index].id);
                          }));
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstants.imageUrl(
                                state.popularMovies[index].backdropPath),
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
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
