import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_use_case.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';

import '../repository/base_movie_repository.dart';

class GetRecommendationUsecase
    extends BaseUseCase<List<Recommendation>, RecommendationParams> {
  final BaseMovieRepository _moviesRepository;

  GetRecommendationUsecase(this._moviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParams parameters) async {
    return await _moviesRepository.getRecommendation(parameters);
  }
}

class RecommendationParams extends Equatable {
  final int movieId;

  const RecommendationParams(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
