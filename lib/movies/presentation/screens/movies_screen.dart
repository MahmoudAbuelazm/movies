import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/bloc/movies_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MoviesBloc()..add(const GetNowPlayingMovies());
      },
      lazy: false,
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          print(state);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Movies'),
            ),
            body: const Center(
              child: Text('Movies Screen'),
            ),
          );
        },
      ),
    );
  }
}
