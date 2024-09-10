import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_string.dart';
import '../../controller/tv_bloc/tv_bloc.dart';
import '../../screens/tv_popular_screen.dart';
import 'list_view_item_component.dart';
import 'see_more_container.dart';

class TvPopularComponent extends StatelessWidget {
  const TvPopularComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      buildWhen: (previous, current) =>
          previous.popularTvShows != current.popularTvShows,
      builder: (context, state) {
        pragma('Popular Tv Shows: ${state.popularTvShows.length}');
        return Column(
          children: [
            SeeMoreContainer(
              text: AppString.popular,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TvPopularScreen(
                    movies: state.popularTvShows,
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
                  itemCount: state.popularTvShows.length,
                  itemBuilder: (context, index) {
                    final reversedList = state.popularTvShows.reversed.toList();
                    return ListViewItem(
                        index: index, movie: reversedList[index]);
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
