import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:something/config/playerController.dart';
import 'package:something/config/score.dart';
import 'package:something/pages/Menu.dart';
import 'package:something/pages/home_page.dart';
import 'package:something/theme/mybutton.dart';

class GameOver extends StatefulWidget {
  const GameOver({Key? key}) : super(key: key);

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  scoreController c = Get.put(scoreController());
  PlayerController playerController = Get.put(PlayerController());
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
              border: Border.all(color: Colors.black, width: 2)),
          child: Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 20)),
              Expanded(
                child: Column(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.skull,
                      size: 50,
                      color: Colors.black,
                    ),
                    Text("Game Over",
                        style: GoogleFonts.fuzzyBubbles(
                            textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: Colors.black))),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text("Your Score: ${c.score}",
                        style: GoogleFonts.fuzzyBubbles(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black))),
                    Text("Best Score:  ${playerController.playerList[0].score}",
                        style: GoogleFonts.fuzzyBubbles(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black))),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    MyButton(text: "re-challenge", ontap: _rechang),
                    const Padding(padding: EdgeInsets.only(top: 30)),
                    MyButton(text: "Quit", ontap: _quit),
                  ],
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }

  _rechang() {
    c.score = 0.obs;
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.bottomToTop,
        child: const MyHomePage(),
      ),
    );
  }

  _quit() {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.bottomToTop,
        child: const Menu(),
      ),
    );
  }
}
