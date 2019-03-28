import 'package:tasks/models/intro.dart';

class IntroProvider {
  Future<List<IntroModel>> getIntros() async {
    final List<IntroModel> pages = [
      IntroModel(
        id: 1,
        title: 'Never more in rush',
        subTitle: 'Check and keep under controll your daily tasks, is a creative way.',
      ),
      IntroModel(
        id: 2,
        title: 'Never more in rush',
        subTitle: 'Check and keep under controll your daily tasks, is a creative way.',
      ),
    ];
    return pages;
  }
}