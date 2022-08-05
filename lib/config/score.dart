import 'package:get/get.dart';

class scoreController extends GetxController {
  var score = 0.obs;

  addScore() {
    score += 1;
  }
}
