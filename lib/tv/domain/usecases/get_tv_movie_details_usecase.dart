import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_use_case.dart';
import 'package:movies/tv/domain/repository/base_tv_repository.dart';

import '../entities/tv_movie_details.dart';

class GetTvMovieDetailsUsecase
    extends BaseUseCase<TvMovieDetails, TvMovieDetailsParams> {
  final BaseTvRepository _tvRepository;

  GetTvMovieDetailsUsecase(this._tvRepository);


  @override
  Future<Either<Failure, TvMovieDetails>> call(TvMovieDetailsParams parameters)async {
    return await _tvRepository.getTvMovieDetails(parameters);
  }


  
  
}

class TvMovieDetailsParams extends Equatable {
  final int movieId;

  const TvMovieDetailsParams(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
