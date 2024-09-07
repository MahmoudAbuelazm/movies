import 'package:dartz/dartz.dart';
import 'package:movies/tv/domain/entities/tv_movie.dart';
import 'package:movies/tv/domain/repository/tv_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_use_case.dart';

class GetTopRatedTvUsecase extends BaseUseCase<List<TvMovie>, NoParams> {
  final TvRepository _tvRepository;

  GetTopRatedTvUsecase(this._tvRepository);

  @override
  Future<Either<Failure, List<TvMovie>>> call(NoParams parameters) async {
    return await _tvRepository.getTopRated();
  }
}
