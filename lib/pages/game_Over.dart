// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:something/object/player_controller.dart';
import 'package:something/object/questions_controller.dart';
import 'package:something/object/score.dart';
import 'package:something/pages/Menu.dart';
import 'package:something/pages/home_page.dart';
import 'package:something/theme/my_font.dart';
import 'package:something/theme/mybutton.dart';

import '../theme/my_color.dart';

class GameOver extends StatefulWidget {
  const GameOver({Key? key}) : super(key: key);

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  QuestionsController questionsController = Get.put(QuestionsController());
  //score
  Score scoreController = Get.put(Score());
  //player
  PlayerController playerController = Get.put(PlayerController());
  @override
  void initState() {
    super.initState();
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
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 20)),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/game_over.png",
                        width: 100,
                        height: 100,
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(2),
                          width: 330,
                          height: 250,
                          decoration: BoxDecoration(
                              color: myColor().board,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black, width: 2),
                              boxShadow: [
                                const BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(0, 0),
                                    spreadRadius: 4),
                                BoxShadow(
                                    color: myColor().black,
                                    offset: const Offset(0, 0),
                                    spreadRadius: 2)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "Điểm của bạn: ${scoreController.score.toInt()}",
                                  textAlign: TextAlign.start,
                                  style: MyFont().body),
                              const Padding(padding: EdgeInsets.all(5)),
                              Text(
                                  textAlign: TextAlign.start,
                                  "Điểm cao nhất: ${playerController.listPlayer.elementAt(0).score}",
                                  style: MyFont().body),
                              const Padding(padding: EdgeInsets.all(5)),
                              AutoSizeText(
                                  "Đáp án đúng: ${scoreController.result.value}",
                                  textAlign: TextAlign.center,
                                  minFontSize: 12,
                                  maxLines: 2,
                                  style: MyFont().body),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    children: [
                      MyButton(
                        padding: 15,
                        fontSize: 15,
                        width: 150,
                        height: 50,
                        color: myColor().green,
                        text: "Chơi lại",
                        ontap: () {
                          questionsController.shuffle();
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.elasticInOut,
                              type: PageTransitionType.fade,
                              child: const MyHomePage(),
                            ),
                          );
                        },
                      ),
                      const Padding(padding: EdgeInsets.only(top: 30)),
                      MyButton(
                        padding: 15,
                        fontSize: 15,
                        width: 150,
                        height: 50,
                        color: myColor().red,
                        text: "Trang chủ",
                        ontap: () {
                          questionsController.shuffle();
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.elasticInOut,
                              type: PageTransitionType.fade,
                              child: const Menu(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
