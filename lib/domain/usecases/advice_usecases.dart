import 'package:advicer_app/domain/entities/advice_entity.dart';

class AdviceUseCases {
  Future<AdviceEntity> getAdvice() async {
    // for example get and advice
    await Future.delayed(const Duration(seconds: 3), () {});
    return const AdviceEntity(advice: 'fake advice to test', id: 1);
  }
}
