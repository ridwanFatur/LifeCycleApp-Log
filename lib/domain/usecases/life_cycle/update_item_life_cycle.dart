import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/life_cycle_repository.dart';
import '../../../core/constants/warning_message.dart';

class UpdateItemLifeCycle extends LocalUseCase<bool, UpdateItemLifeCycleParams> {
  final LifeCycleRepository repository;
  UpdateItemLifeCycle(this.repository);

  @override
  Either<Failure, bool> call(UpdateItemLifeCycleParams params) {
    try {
      final result = repository.updateItemLifeCycle(params);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.message));
    }   catch (e) {
      return const Left(ServerFailure(WarningMessage.thereIsUnexpectedError));
    }
  }
}

class UpdateItemLifeCycleParams extends Equatable {
  final int index;
  final String data;

  const UpdateItemLifeCycleParams({
    required this.index,
    required this.data,
  });

  @override
  List<Object?> get props => [
        index,
        data,
      ];
}
