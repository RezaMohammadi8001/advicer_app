// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:advicer_app/data/datasources/advice_remote_datasource.dart';
import 'package:advicer_app/data/exceptions/exceptions.dart';
import 'package:advicer_app/domain/entities/advice_entity.dart';
import 'package:advicer_app/domain/failures/failures.dart';
import 'package:advicer_app/domain/repositories/advice_repo.dart';

class AdviceRepoImpl implements AdviceRepo {
  final AdviceRemoteDatasource adviceRemoteDatasource;
  AdviceRepoImpl({
    required this.adviceRemoteDatasource,
  });
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {
    try {
      final response =
          await adviceRemoteDatasource.getRandomeAdviceFromDatasource();
      return right(response);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } on CacheException catch (_) {
      return left(CacheFailure());
    } on Exception {
      return left(GeneralFailure());
    }
  }
}
