import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/presentation/controller/bloc/movies_bloc.dart';

import '../../../core/utils/app_string.dart';
import '../screens/popular_screen.dart';
import 'list_view_item_component.dart';
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
                    return ListViewItem(
                        index: index, movie: state.popularMovies[index]);
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
