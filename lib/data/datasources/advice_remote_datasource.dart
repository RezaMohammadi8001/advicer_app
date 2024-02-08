// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:advicer_app/data/models/adivce_model.dart';

abstract class AdviceRemoteDatasource {
  Future<AdviceModel> getRandomeAdviceFromDatasource();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final Dio dio = Dio();

  @override
  Future<AdviceModel> getRandomeAdviceFromDatasource() async {
    final response =
        await dio.get('https://api.flutter-community.com/api/v1/advice');
    return AdviceModel.fromJson(response.data);
  }
}
