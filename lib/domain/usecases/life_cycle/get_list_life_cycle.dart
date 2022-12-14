import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/life_cycle_repository.dart';
import '../../../core/constants/warning_message.dart';

class GetListLifeCycle extends LocalUseCase<List<String>, GetListLifeCycleParams> {
  final LifeCycleRepository repository;
  GetListLifeCycle(this.repository);

  @override
  Either<Failure, List<String>> call(
      GetListLifeCycleParams params) {
    try {
      final result = repository.getListLifeCycle(params);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.message));
    }   catch (e) {
      return const Left(ServerFailure(WarningMessage.thereIsUnexpectedError));
    }
  }
}

class GetListLifeCycleParams extends Equatable {
  @override
  List<Object?> get props => [];
}
