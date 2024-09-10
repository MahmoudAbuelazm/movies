import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';

import '../../../../core/network/api_constants.dart';
import '../../controller/tv_bloc/tv_bloc.dart';
import '../../screens/tv_movie_detail_screen.dart';


class OnTheAirComponent extends StatelessWidget {
  const OnTheAirComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      buildWhen: (previous, current) =>
          previous.onTheAirTvShows != current.onTheAirTvShows,
      builder: (context, state) {
        switch (state.onTheAirRequestState) {
          case RequestState.loading:
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.loaded:
            return FadeInDown(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.4,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  onPageChanged: (index, reason) {},
                 
                ),
                items: state.onTheAirTvShows.map(
                  (item) {
                    return GestureDetector(
                      key: const Key('openTvShowMinimalDetail'),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return TvMovieDetailScreen(id: item.id);
                        }));
                      },
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.3, 0.5, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              height: 560.0,
                              imageUrl:
                                  ApiConstants.imageUrl(item.backdropPath),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: Colors.redAccent,
                                        size: 16.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        "On The Air".toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 16.0, left: 16.0, right: 16.0),
                                  child: Text(
                                    item.title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            );

          case RequestState.error:
            return SizedBox(
              height: 400.0,
              child: Center(
                child: Text(state.onTheAirMessage),
              ),
            );
        }
      },
    );
  }
}
