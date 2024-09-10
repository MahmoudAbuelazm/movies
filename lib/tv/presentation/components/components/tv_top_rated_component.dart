import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_string.dart';
import '../../controller/tv_bloc/tv_bloc.dart';
import '../../screens/tv_top_rated_screen.dart';
import 'list_view_item_component.dart';
import 'see_more_container.dart';

class TvTopRatedComponent extends StatelessWidget {
  const TvTopRatedComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      buildWhen: (previous, current) =>
          previous.topRatedTvShows != current.topRatedTvShows,
      builder: (context, state) {
        return Column(
          children: [
            SeeMoreContainer(
              text: AppString.topRated,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TvTopRatedScreen(
                    tvShows: state.topRatedTvShows,
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
                  itemCount: state.topRatedTvShows.length,
                  itemBuilder: (context, index) {
                    return ListViewItem(
                        index: index, movie: state.topRatedTvShows[index]);
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
