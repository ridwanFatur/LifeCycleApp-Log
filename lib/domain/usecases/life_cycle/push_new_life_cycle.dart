import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/life_cycle_repository.dart';
import '../../../core/constants/warning_message.dart';

class PushNewLifeCycle extends LocalUseCase<bool, PushNewLifeCycleParams> {
  final LifeCycleRepository repository;
  PushNewLifeCycle(this.repository);

  @override
  Either<Failure, bool> call(PushNewLifeCycleParams params) {
    try {
      final result = repository.pushNewLifeCycle(params);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.message));
    }   catch (e) {
      return const Left(ServerFailure(WarningMessage.thereIsUnexpectedError));
    }
  }
}

class PushNewLifeCycleParams extends Equatable {
  final String data;

  const PushNewLifeCycleParams({
    required this.data,
  });

  @override
  List<Object?> get props => [
        data,
      ];
}
