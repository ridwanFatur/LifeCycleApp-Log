import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/life_cycle_repository.dart';
import '../../../core/constants/warning_message.dart';

class DeleteAllItemLifeCycle
    extends LocalUseCase<bool, DeleteAllItemLifeCycleParams> {
  final LifeCycleRepository repository;
  DeleteAllItemLifeCycle(this.repository);

  @override
  Either<Failure, bool> call(DeleteAllItemLifeCycleParams params) {
    try {
      final result = repository.deleteAllItemLifeCycle(params);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return const Left(ServerFailure(WarningMessage.thereIsUnexpectedError));
    }
  }
}

class DeleteAllItemLifeCycleParams extends Equatable {
  const DeleteAllItemLifeCycleParams();

  @override
  List<Object?> get props => [];
}
