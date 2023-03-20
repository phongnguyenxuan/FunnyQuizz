// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:something/object/player_controller.dart';
import 'package:something/object/questions_controller.dart';
import 'package:something/pages/Menu.dart';
import 'package:something/theme/my_color.dart';
import 'package:something/theme/mybutton.dart';

import '../object/player.dart';

class Rank extends StatefulWidget {
  const Rank({Key? key}) : super(key: key);

  @override
  State<Rank> createState() => _RankState();
}

class _RankState extends State<Rank> {
  PlayerController playerController = Get.put(PlayerController());
  QuestionsController questionsController = Get.put(QuestionsController());
  @override
  void initState() {
    playerController.getPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2, top: 2),
                      child: MyButton(
                          color: myColor().exit,
                          width: 35,
                          height: 35,
                          fontSize: 13,
                          text: "X",
                          ontap: () {
                            questionsController.shuffle();
                            Navigator.push(
                              context,
                              PageTransition(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.elasticInOut,
                                type: PageTransitionType.topToBottom,
                                child: const Menu(),
                              ),
                            );
                          },
                          padding: 2),
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 20,
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Hạng",
                              style: GoogleFonts.fuzzyBubbles(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ))),
                          Text("Tên",
                              style: GoogleFonts.fuzzyBubbles(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ))),
                          Text("Điểm",
                              style: GoogleFonts.fuzzyBubbles(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              )))
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 20,
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    _showRank(),
                  ],
                ))));
  }

  Expanded _showRank() {
    return Expanded(
      child: Obx(
        () {
          if (playerController.listPlayer.isNotEmpty) {
            //tren 20 nguoi se xoa nhung nguoi phia sau
            if (playerController.listPlayer.length > 20) {
              playerController
                  .deletePlayer(playerController.listPlayer.last.id!.toInt());
            }
            playerController.getPlayer();
            return ListView.builder(
                itemCount: playerController.listPlayer.length,
                itemBuilder: (context, index) {
                  Player player = playerController.listPlayer[index];
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.elasticInOut,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(bottom: 12),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(16),
                                color: const Color.fromARGB(255, 244, 245, 244),
                              ),
                              child: Row(children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      _rank(index),
                                      const Spacer(),
                                      Text(player.name.toString(),
                                          style: GoogleFonts.fuzzyBubbles(
                                              textStyle: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900,
                                          ))),
                                      const Spacer(),
                                      Text(
                                        player.score.toString(),
                                        style: GoogleFonts.fuzzyBubbles(
                                            textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          )));
                });
          } else {
            // ignore: avoid_unnecessary_containers
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/empty.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Không có dữ liệu",
                      style: GoogleFonts.fuzzyBubbles(
                          textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      )),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Container _rank(int index) {
    if (index + 1 == 1) {
      // ignore: avoid_unnecessary_containers
      return Container(
        child: SizedBox(
            width: 20,
            height: 20,
            child: Image.asset("assets/images/number_1.png")),
      );
    }
    if (index + 1 == 2) {
      // ignore: avoid_unnecessary_containers
      return Container(
        child: SizedBox(
            width: 20,
            height: 20,
            child: Image.asset("assets/images/number_2.png")),
      );
    }
    if (index + 1 == 3) {
      // ignore: avoid_unnecessary_containers
      return Container(
        child: SizedBox(
            width: 20,
            height: 20,
            child: Image.asset("assets/images/number_3.png")),
      );
    } else {
      // ignore: avoid_unnecessary_containers
      return Container(
        child: Text((index + 1).toString(),
            style: GoogleFonts.fuzzyBubbles(
                textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ))),
      );
    }
  }
}
