import 'package:dartz/dartz.dart';
import 'package:movies/tv/domain/entities/tv_movie.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_use_case.dart';
import '../repository/tv_repository.dart';

class GetPopularTvUsecase extends BaseUseCase <List<TvMovie>,NoParams>{
  final TvRepository _tvRepository;

  GetPopularTvUsecase(this._tvRepository);


  @override
  Future<Either<Failure, List<TvMovie>>>  call( NoParams parameters) async {
    return await _tvRepository.getPopular();
  }
}