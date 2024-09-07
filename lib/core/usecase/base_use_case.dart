import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';


abstract class BaseUseCase <T , Parameters>{
 Future<Either<Failure,T>> call(Parameters parameters);
}

class NoParams extends Equatable{
  @override
  List<Object> get props => [];
}