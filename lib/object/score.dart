import 'package:get/get.dart';

class Score extends GetxController {
  var score = 0.obs;
  var result = "".obs;
  addScore() {
    return score += 1;
  }

  // ignore: no_leading_underscores_for_local_identifiers
  getResult(_result) {
    return result.value = _result;
  }
}
