
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/life_cycle_repository.dart';
import '../../../core/constants/warning_message.dart';

class GetItemLifeCycle extends LocalUseCase<String?, GetItemLifeCycleParams> {
  final LifeCycleRepository repository;
  GetItemLifeCycle(this.repository);

  @override
  Either<Failure, String?> call(GetItemLifeCycleParams params) {
    try {
      final result = repository.getItemLifeCycle(params);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.message));
    }   catch (e) {
      return const Left(ServerFailure(WarningMessage.thereIsUnexpectedError));
    }
  }
}

class GetItemLifeCycleParams extends Equatable {
  final int index;

  const GetItemLifeCycleParams({
    required this.index,
  });

  @override
  List<Object?> get props => [
        index,
      ];
}
