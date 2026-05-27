import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isPreviewMode = false;

  void setPreviewMode(bool value) {
    isPreviewMode = value;
    update();
  }
}
