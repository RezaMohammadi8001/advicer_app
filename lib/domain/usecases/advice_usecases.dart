import 'package:advicer_app/domain/entities/advice_entity.dart';
import 'package:advicer_app/domain/failures/failures.dart';
import 'package:advicer_app/domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  final AdviceRepo adviceRepo;
  AdviceUseCases({required this.adviceRepo});
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    // for example get and advice
    return adviceRepo.getAdviceFromDatasource();
  }
}
