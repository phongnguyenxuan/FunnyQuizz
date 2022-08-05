import 'dart:async';

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:something/config/playerController.dart';
import 'package:something/config/score.dart';
import 'package:something/pages/add_high_score.dart';
import 'package:something/pages/game_Over.dart';
import 'package:something/theme/my_input.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final playerController = Get.put(PlayerController());
  var randomA = Random();
  var randomB = Random();
  late int a = randomA.nextInt(250);
  late int b = randomB.nextInt(250);
  var Calcu = ["+", "-", "x", "/"];
  var randomCalcu = Random();
  late var _math = Calcu[randomCalcu.nextInt(Calcu.length)];
  String dapan = "?";
  String _state = " ";
  Color _color = Colors.black;
  Color _colorTime = Colors.black;
  TextEditingController controller = TextEditingController();
  //life icon
  int life = 3;
  IconData heart1 = FontAwesomeIcons.solidHeart;
  IconData heart2 = FontAwesomeIcons.solidHeart;
  IconData heart3 = FontAwesomeIcons.solidHeart;
  //lottie
  String _lottieURL = "assets/question.json";
  //timer
  late Timer _timer;
  int _time = 30;
  //score
  scoreController c = Get.put(scoreController());

  @override
  void initState() {
    super.initState();
    c.score = 0.obs;
    setState(() {
      _timeCounter();
      _checkNum();
      _checkDivision();
      _checkMulti();
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
              border: Border.all(color: Colors.black, width: 2)),
          child: Stack(
            children: [
              Column(
                children: [
                  _lifeBar(),
                  Expanded(flex: 4, child: _Questions(context)),
                  Expanded(flex: 2, child: _inputAnswer()),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _inputAnswer() {
    return Column(children: [
      const Padding(padding: EdgeInsets.only(top: 15)),
      Expanded(
        flex: 1,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text("$_state",
              style: GoogleFonts.fuzzyBubbles(
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: _color))),
        ),
      ),
      const Padding(padding: EdgeInsets.only(top: 15)),
      Expanded(
        flex: 1,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text("Answer: ",
              style: GoogleFonts.fuzzyBubbles(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black))),
        ),
      ),
      Expanded(
        flex: 3,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        offset: const Offset(0, 6),
                        spreadRadius: 2)
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  autofocus: false,
                  cursorColor: Colors.black,
                  controller: controller,
                  onTap: () {},
                  onFieldSubmitted: (value) {
                    setState(() {
                      dapan = controller.text;
                      _checkResult();
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      dapan = controller.text;
                    });
                  },
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  Column _Questions(BuildContext context) {
    return Column(children: [
      Expanded(
          child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Lottie.asset(_lottieURL))),
      Expanded(
        child: FractionallySizedBox(
          heightFactor: 0.2,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Text(
              "Question",
              style: GoogleFonts.fuzzyBubbles(
                  textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.black)),
            ),
          ),
        ),
      ),
      Expanded(
        child: FractionallySizedBox(
          heightFactor: 0.8,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MyInput(
                    number: a.toString(),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text("$_math",
                          style: GoogleFonts.fuzzyBubbles(
                              textStyle: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)))),
                  MyInput(
                    number: b.toString(),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text("=",
                          style: GoogleFonts.fuzzyBubbles(
                              textStyle: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)))),
                  MyInput(
                    number: dapan,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  Padding _lifeBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: FaIcon(
                      heart1,
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: FaIcon(
                      heart2,
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: FaIcon(
                      heart3,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                children: [
                  Obx(
                    () => Text(
                      "Scores: ${c.score}",
                      style: GoogleFonts.fuzzyBubbles(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.black)),
                    ),
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Time left: ",
                          style: GoogleFonts.fuzzyBubbles(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black)),
                          children: [
                        TextSpan(
                          text: "$_time",
                          style: GoogleFonts.fuzzyBubbles(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  color: _colorTime)),
                        )
                      ]))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _timeCounter() {
    const onSec = Duration(seconds: 1);
    _timer = Timer.periodic(onSec, (timer) {
      if (_time <= 6) {
        setState(() {
          _colorTime = Colors.red;
        });
      }
      if (_time == 0) {
        setState(() {
          timer.cancel();
          _color = Colors.red;
          _state = "Time out";
        });
        _nextQuestion();
        _timeCounter();
        life -= 1;
        _displayLife();
      } else {
        setState(() {
          _time--;
        });
      }
    });
  }

  _checkNum() {
    if (_math == "-") {
      setState(() {
        int temp = a;
        if (a < b) {
          a = b;
          b = temp;
        } else {
          a = a;
          b = b;
        }
      });
    }
  }

  _checkResult() {
    setState(() {
      try {
        if (dapan == "?" || dapan == "") {
          _color = Colors.red;
          _state = "Enter your answer";
        }

        _mathCheck();

        //next sang cau moi
      } catch (e) {
        print(e);
      }
    });
  }

  _checkDivision() {
    if (_math == "/") {
      for (;;) {
        if (a % b == 0 && b != 0) {
          setState(() {
            a = a;
            b = b;
          });
          break;
        } else {
          a = randomA.nextInt(100);
          b = randomB.nextInt(100) + 1;
          _checkDivision();
        }
      }
    }
  }

  _checkMulti() {
    if (_math == "x") {
      a = randomA.nextInt(20);
      b = randomB.nextInt(20);
    }
  }

  _mathCheck() {
    setState(() {
      switch (_math) {
        case "+":
          _add();
          break;
        case "-":
          _minus();
          break;
        case "x":
          _multiplication();
          break;
        case "/":
          _division();
          break;
      }
    });
  }

  _add() {
    int result = int.parse(dapan);
    if (a + b == result) {
      _state = "Correct";
      _color = Colors.green;
      _lottieURL = "assets/correct.json";
      c.addScore();
    } else if (a + b != result) {
      _state = "Wrong !! correct answer: ${a + b}";
      _color = Colors.red;
      _lottieURL = "assets/wrong.json";
      life -= 1;
      _displayLife();
    }
    _nextQuestion();
  }

  _minus() {
    int result = int.parse(dapan);
    if (a - b == result) {
      _state = "Correct";
      _color = Colors.green;
      _lottieURL = "assets/correct.json";
      c.addScore();
    } else if (a - b != result) {
      _state = "Wrong !! correct answer: ${a - b}";
      _color = Colors.red;
      _lottieURL = "assets/wrong.json";
      life -= 1;
      _displayLife();
    }
    _nextQuestion();
  }

  _multiplication() {
    int result = int.parse(dapan);
    if (a * b == result) {
      _state = "Correct";
      _color = Colors.green;
      _lottieURL = "assets/correct.json";
      c.addScore();
    } else if (a * b != result) {
      _state = "Wrong !! correct answer: ${a * b}";
      _color = Colors.red;
      _lottieURL = "assets/wrong.json";
      life -= 1;
      _displayLife();
    }
    _nextQuestion();
  }

  _division() {
    double result = double.parse(dapan);
    if (a / b == result) {
      _state = "Correct";
      _color = Colors.green;
      _lottieURL = "assets/correct.json";
      c.addScore();
    } else if (a / b != result) {
      _state = "Wrong !! correct answer: ${a ~/ b}";
      _color = Colors.red;
      _lottieURL = "assets/wrong.json";
      life -= 1;
      _displayLife();
    }
    _nextQuestion();
  }

  _nextQuestion() {
    _time = 30;
    _colorTime = Colors.black;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        a = randomA.nextInt(250);
        b = randomB.nextInt(250);
        //  _checkNum();
        _math = Calcu[randomCalcu.nextInt(Calcu.length)];
        if (_math == "-") {
          _checkNum();
        }
        if (_math == "/") {
          _checkDivision();
        }
        if (_math == "x") {
          _checkMulti();
        }
        controller.text = "";
        dapan = "?";
        _state = " ";
        _lottieURL = "assets/question.json";
      });
    });
  }

  _displayLife() {
    setState(() {
      switch (life) {
        case 3:
          break;
        case 2:
          heart3 = FontAwesomeIcons.heart;
          break;
        case 1:
          heart3 = FontAwesomeIcons.heart;
          heart2 = FontAwesomeIcons.heart;
          break;
        case 0:
          heart2 = FontAwesomeIcons.heart;
          heart1 = FontAwesomeIcons.heart;
          _gameOver();
          break;
      }
    });
  }

  _gameOver() {
    if (playerController.playerList.isEmpty) {
      Get.to(const AddHighScore());
    } else if (playerController.playerList.isNotEmpty) {
      for (int i = 0; i < playerController.playerList.length; i++) {
        int sc = playerController.playerList[0].score!;
        if (c.score > sc) {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: const AddHighScore(),
            ),
          );
        } else {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: const GameOver(),
            ),
          );
        }
      }
    }
  }
}
