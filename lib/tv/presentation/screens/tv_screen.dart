import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/tv/presentation/controller/bloc/tv_bloc.dart';

import '../../../core/services/services_loactor.dart';
import '../components/components/on_the_air_component.dart';
import '../components/components/tv_popular_component.dart';
import '../components/components/tv_top_rated_component.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvBloc>()
        ..add(const GetOnTheAirTv())
        ..add(const GetPopularTv())
        ..add(const GetTopRatedTv()),
      child: const Scaffold(
        body: SingleChildScrollView(
          key: Key('tvScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OnTheAirComponent(),
              TvPopularComponent(),
              TvTopRatedComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
