import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';

import '../../movies/domain/entities/movie.dart';

abstract class BaseUseCase {
 Future<Either<Failure,List<Movie>>> call();
}
