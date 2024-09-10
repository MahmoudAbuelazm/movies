import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_use_case.dart';
import 'package:movies/tv/domain/entities/more_like_this.dart';

import '../repository/base_tv_repository.dart';


class GetMoreLikeThisUsecase
    extends BaseUseCase<List<MoreLikeThis>, MoreLikeThisParams> {
  final BaseTvRepository _tvRepository;

  GetMoreLikeThisUsecase(this._tvRepository);
  
  @override
  Future<Either<Failure, List<MoreLikeThis>>> call(MoreLikeThisParams parameters) {
    return _tvRepository.getMoreLikeThis(parameters);
  }

  


  
}

class MoreLikeThisParams extends Equatable {
  final int movieId;

  const MoreLikeThisParams(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
