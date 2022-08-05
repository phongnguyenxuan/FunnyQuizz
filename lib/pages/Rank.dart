import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:something/config/player.dart';
import 'package:something/config/playerController.dart';
import 'package:something/pages/Menu.dart';

class Rank extends StatefulWidget {
  const Rank({Key? key}) : super(key: key);

  @override
  State<Rank> createState() => _RankState();
}

class _RankState extends State<Rank> {
  final playerController = Get.put(PlayerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: const Menu(),
                            ),
                          );
                        },
                        icon: const FaIcon(FontAwesomeIcons.x)),
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
                          Text("Rank",
                              style: GoogleFonts.fuzzyBubbles(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ))),
                          Text("Name",
                              style: GoogleFonts.fuzzyBubbles(
                                  textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ))),
                          Text("Score",
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
          if (playerController.playerList.isNotEmpty) {
            return ListView.builder(
                itemCount: playerController.playerList.length,
                itemBuilder: (context, index) {
                  Player player = playerController.playerList[index];
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                          child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
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
            return Container();
          }
        },
      ),
    );
  }

  Container _rank(int index) {
    if (index + 1 == 1) {
      return Container(
        child:
            SizedBox(width: 30, height: 30, child: Image.asset("assets/1.png")),
      );
    }
    if (index + 1 == 2) {
      return Container(
        child:
            SizedBox(width: 30, height: 30, child: Image.asset("assets/2.png")),
      );
    }
    if (index + 1 == 3) {
      return Container(
        child:
            SizedBox(width: 30, height: 30, child: Image.asset("assets/3.png")),
      );
    } else {
      return Container(
        child: Text((index + 1).toString(),
            style: GoogleFonts.fuzzyBubbles(
                textStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ))),
      );
    }
  }
}
