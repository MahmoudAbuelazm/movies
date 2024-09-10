import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_string.dart';
import '../controller/bloc/movies_bloc.dart';
import '../screens/top_rated_screen.dart';
import 'list_view_item_component.dart';
import 'see_more_container.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.topRatedMovies != current.topRatedMovies,
      builder: (context, state) {
        return Column(
          children: [
            SeeMoreContainer(
              text: AppString.topRated,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TopRatedScreen(
                    movies: state.topRatedMovies,
                  );
                }));
              },
            ),
            FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topRatedMovies.length,
                  itemBuilder: (context, index) {
                    return ListViewItem(
                        index: index, movie: state.topRatedMovies[index]);
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
