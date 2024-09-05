import 'package:flutter/material.dart';
import 'package:movies/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies/movies/data/repository/movies_repository.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_usecase.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    _getDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: const Center(
        child: Text('Movies Screen'),
      ),
    );
  }

  void _getDate() async {
    BaseMovieRemoteDataSource baseMovieRemoteDataSource =
        MovieRemoteDataSource();

    BaseMovieRepository baseMovieRepository =
        MoviesRepository(baseMovieRemoteDataSource);

    final result = await GetNowPlayingUsecase(baseMovieRepository).excute();
    
  }
}
