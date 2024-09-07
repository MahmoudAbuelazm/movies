import 'package:dartz/dartz.dart';
import 'package:movies/tv/domain/repository/tv_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_use_case.dart';
import '../entities/tv_movie.dart';

class GetOnTheAirUsecase extends BaseUseCase <List<TvMovie>,NoParams>{
  final TvRepository _tvRepository;

  GetOnTheAirUsecase(this._tvRepository);
  
  @override
  Future<Either<Failure, List<TvMovie>>> call(NoParams parameters)async {
    return await _tvRepository.getOnTheAir();
  }


 
}
