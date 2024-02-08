import 'package:advicer_app/data/repositories/advice_repo_impl.dart';
import 'package:advicer_app/domain/entities/advice_entity.dart';
import 'package:advicer_app/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    final AdviceRepoImpl adviceRepoImpl = AdviceRepoImpl();
    // for example get and advice
    return adviceRepoImpl.getAdviceFromDatasource();
  }
}
