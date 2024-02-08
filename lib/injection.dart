import 'package:advicer_app/application/pages/advice/bloc/advicer_bloc.dart';
import 'package:advicer_app/data/datasources/advice_remote_datasource.dart';
import 'package:advicer_app/data/repositories/advice_repo_impl.dart';
import 'package:advicer_app/domain/repositories/advice_repo.dart';
import 'package:advicer_app/domain/usecases/advice_usecases.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

Future<void> init() async {
  //! application layer
  sl.registerFactory(() => AdvicerBloc(adviceUseCases: sl()));

  //! domain layer
  sl.registerFactory(() => AdviceUseCases(adviceRepo: sl()));

  //! data layer
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDatasource: sl()));
  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceImpl(dio: sl()));

  //! external
  sl.registerFactory(() => Dio());
}
