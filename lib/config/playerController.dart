import 'package:get/get.dart';
import 'package:something/config/player.dart';
import 'package:something/config/playerDB.dart';

class PlayerController extends GetxController {
  @override
  void onReady() {
    getPlayer();
    super.onReady();
  }

  var playerList = <Player>[].obs;

  Future<int> addPlayer({Player? player}) async {
    return await PlayerDB.insert(player);
  }

  void getPlayer() async {
    List<Map<String, dynamic>> players = await PlayerDB.query();
    playerList
        .assignAll(players.map((data) => new Player.fromJson(data)).toList());
    sortPlayer();
  }

  void sortPlayer() {
    playerList.sort(
      (a, b) => b.score!.toInt().compareTo(a.score!.toInt()),
    );
  }
}
