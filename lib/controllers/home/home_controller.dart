import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxString selectedTag = 'All'.obs;
  final tags = const ['All', 'Back', 'Hips', 'Abs', 'Legs'];

  void changeTag(String tag) {
    selectedTag.value = tag;
  }
}
