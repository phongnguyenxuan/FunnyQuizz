import 'package:get/get.dart';
import 'package:something/object/player.dart';
import 'package:something/object/questions_database.dart';

class PlayerController extends GetxController {
  var listPlayer = <Player>[].obs;
  @override
  void onInit() {
    getPlayer();
    super.onInit();
  }

  void deletePlayer(int id) async {
    await QuestionDatabase.deletePlayer(id);
  }

  Future<int> addPlayer({Player? player}) async {
    return await QuestionDatabase.insertPlayer(player);
  }

  void getPlayer() async {
    List<Map<String, dynamic>> player = await QuestionDatabase.getPlayer();
    listPlayer.assignAll(player.map((data) => Player.fromJson(data)).toList());
    listPlayer.sort((a, b) => b.score!.compareTo(a.score!));
  }
}
