import 'package:get/get.dart';

class WelcomeMessageController extends GetxController {
  String message = '';

  void changeMessage(String msg) {
    message = msg;
    update();
  }
}