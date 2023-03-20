import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:something/object/player_controller.dart';
import 'package:something/object/score.dart';
import 'package:something/pages/Rank.dart';
import 'package:something/theme/my_color.dart';
import 'package:something/theme/my_font.dart';
import 'package:something/theme/mybutton.dart';

import '../object/player.dart';

class AddHighScore extends StatefulWidget {
  const AddHighScore({Key? key}) : super(key: key);

  @override
  State<AddHighScore> createState() => _AddHighScoreState();
}

class _AddHighScoreState extends State<AddHighScore> {
  TextEditingController controller = TextEditingController();
  Score scoreController = Get.put(Score());
  PlayerController playerController = Get.put(PlayerController());
  //audio
  late AudioPlayer audioPlayer;
  // ignore: unnecessary_new
  AudioCache audioCache = new AudioCache();
  late int _score;
  late String read = '';
  @override
  void initState() {
    _score = scoreController.score.toInt();
    super.initState();
    audioPlayer = AudioPlayer();
    audioCache.prefix = "assets/";
    audioPlayer.play(AssetSource("winning.mp3"),
        position: const Duration(milliseconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor().background,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 2)),
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Text("Điểm cao mới", style: MyFont().header),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 230,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Lottie.asset(
                              "assets/lottie/firework.json",
                            ),
                            Image.asset(
                              "assets/images/trophy.png",
                              width: 70,
                              height: 70,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    children: [
                      Text(
                        "Enter your name",
                        style: MyFont().body,
                      ),
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            style: MyFont().body,
                            autofocus: false,
                            cursorColor: Colors.black,
                            controller: controller,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 0)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 0)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: MyButton(
                          icon: FontAwesomeIcons.check,
                          color: myColor().green,
                          width: 150,
                          height: 50,
                          fontSize: 15,
                          padding: 20,
                          ontap: () {
                            checkNull();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ) //  const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  checkNull() {
    if (controller.text == "") {
      Get.snackbar("", "",
          reverseAnimationCurve: Curves.easeInOutBack,
          duration: const Duration(milliseconds: 1500),
          snackPosition: SnackPosition.TOP,
          titleText: Image.asset(
            "assets/images/wrong.png",
            width: 100,
            height: 100,
          ),
          messageText: Text("Bạn không được để trống tên",
              textAlign: TextAlign.center, style: MyFont().body),
          boxShadows: const [
            BoxShadow(
                color: Colors.black54,
                offset: Offset(0, 5),
                blurRadius: 2,
                spreadRadius: 1)
          ],
          backgroundColor: Colors.white,
          colorText: Colors.black,
          borderWidth: 2,
          borderColor: Colors.black);
    } else {
      _addPlayer();
      Future.delayed(const Duration(milliseconds: 270), () {
        Navigator.push(
            context,
            PageTransition(
              child: const Rank(),
              duration: const Duration(milliseconds: 300),
              curve: Curves.elasticInOut,
              type: PageTransitionType.fade,
            ));
      });
    }
  }

  _addPlayer() async {
    // ignore: unused_local_variable
    int value = await playerController.addPlayer(
        player: Player(
      name: controller.text.toString(),
      score: _score,
    ));
  }
}
