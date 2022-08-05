import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:something/config/player.dart';
import 'package:something/config/playerController.dart';
import 'package:something/config/score.dart';
import 'package:something/pages/Rank.dart';

class AddHighScore extends StatefulWidget {
  const AddHighScore({Key? key}) : super(key: key);

  @override
  State<AddHighScore> createState() => _AddHighScoreState();
}

class _AddHighScoreState extends State<AddHighScore> {
  late TextEditingController controller;
  bool isbuttonactive = false;
  scoreController score = Get.put(scoreController());
  PlayerController playerController = Get.put(PlayerController());
  late int sc;
  @override
  void initState() {
    sc = score.score.toInt();
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      final isbuttonactive = controller.text.isNotEmpty;
      setState(() {
        this.isbuttonactive = isbuttonactive;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 5)),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            "New highscore",
                            style: GoogleFonts.fuzzyBubbles(
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                              width: 200,
                              height: 200,
                              child: Lottie.asset("assets/cup.json",
                                  repeat: true)),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      children: [
                        Text(
                          "Enter your name",
                          style: GoogleFonts.fuzzyBubbles(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black)),
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
                          padding: const EdgeInsets.only(top: 10),
                          child: ElevatedButton.icon(
                              onPressed: isbuttonactive
                                  ? () {
                                      _addScoreToDatabase();
                                      playerController.getPlayer();
                                      Get.to(const Rank());
                                    }
                                  : null,
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10)),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.green),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              icon: const FaIcon(FontAwesomeIcons.check),
                              label: Text(
                                "submit",
                                style: GoogleFonts.fuzzyBubbles(
                                    textStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                )),
                              )),
                        ),
                      ],
                    ),
                  ),
                )
                //  const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _addScoreToDatabase() async {
    int value = await playerController.addPlayer(
        player: Player(score: sc, name: controller.text));
  }
}
