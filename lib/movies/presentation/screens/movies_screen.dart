import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/presentation/controller/bloc/movies_bloc.dart';

import '../../../core/services/services_loactor.dart';
import '../components/now_playing_component.dart';
import '../components/popular_component.dart';
import '../components/see_more_container.dart';
import '../components/top_rated_component.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(const GetNowPlayingMovies())
        ..add(const GetPopularMovies())..add(const GetTopRatedMovies()),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponent(),
              SeeMoreContainer(
                text: "Popular",
                onTap: () {
                  /// TODO : NAVIGATION TO Popular Movies Screen
                },
              ),
              const PopularComponent(),
              SeeMoreContainer(
                text: "Top Rated",
                onTap: () {
                  /// TODO : NAVIGATION TO Top Rated Movies Screen
                },
              ),
              const TopRatedComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
