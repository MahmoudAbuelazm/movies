import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_use_case.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';

class GetMovieDetailsUsecase extends BaseUseCase <MovieDetails>{
  @override
  Future<Either<Failure, MovieDetails>> call() {
    throw UnimplementedError();
  }
  
}