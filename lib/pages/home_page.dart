import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:something/object/player_controller.dart';
import 'package:something/object/questions_controller.dart';
import 'package:something/object/score.dart';
import 'package:something/pages/Menu.dart';
import 'package:something/pages/add_high_score.dart';
import 'package:something/pages/complete.dart';
import 'package:something/pages/game_Over.dart';
import 'package:something/theme/my_color.dart';
import 'package:something/theme/my_font.dart';
import 'package:something/theme/my_input.dart';
import 'package:something/theme/mybutton.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PlayerController playerController = Get.put(PlayerController());
  late QuestionsController questionsController;
  //audio
  late AudioPlayer audioPlayer;
  // ignore: unnecessary_new
  AudioCache audioCache = new AudioCache();
  late String answer1;
  late String answer2;
  late String answer3;
  late String answer4;
  late String result;
  late String question;
  late String correct;
  late int i;
  late bool isClick = false;
  var listAns = [];
  var listIndex = [0, 1, 2, 3];
  //score
  Score scoreController = Get.put(Score());
  //quotes
  var quotes = [
    "Sai rồi chúc bạn may mắn lần sau",
    "Đang đoán mò hay gì thế ?",
    "Trái nghĩa với đúng là sai đấy :))",
    "IQ vô cực",
    "IQ 10000000000 tỷ",
    "Sai đâu còn không biết à ?",
    "Vui làm gì. Trầm cảm lên em",
    "Hãy nhìn vào ánh mắt chân thành này của tôi. Tôi thật sự không lừa bạn.",
    "Nhìn phát biết ngay đây đích thị không phải là đáp án",
    "Thôiiiiiiiiiiiiiiiiii",
    "Yamete kudasai",
    "Tatakae...tatakae..tatakaeeeeeeee!!",
    "Không giòn !!",
    "Never Gonna Give You Up"
  ];
  var randomQuotes = Random();
  late var wrong = quotes[randomQuotes.nextInt(quotes.length)];
  //life
  late int life;
  late bool heart1;
  late bool heart2;
  late bool heart3;
  //
  var image = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
  ];
  var random = Random();
  late var avatar = image[random.nextInt(image.length)];
  @override
  void initState() {
    super.initState();
    questionsController = Get.put(QuestionsController());
    audioPlayer = AudioPlayer();
    audioCache.prefix = "assets/";
    //reset
    i = 0;
    life = 3;
    heart1 = true;
    heart2 = true;
    heart3 = true;
    scoreController.score = 0.obs;
    //shuffle answer
    listIndex.shuffle();
  }

  void playcorrect() async {
    try {
      await audioPlayer.play(AssetSource("correct.mp3"),
          position: const Duration(milliseconds: 0));
    } catch (e) {
      //print(e);
    }
  }

  void playwrong() async {
    try {
      await audioPlayer.play(AssetSource("wrong.mp3"),
          position: const Duration(milliseconds: 0));
    } catch (e) {
      //  print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: myColor().background,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 2)),
          child: _inputAnswer(),
        ),
      ),
    );
  }

  Obx _inputAnswer() {
    return Obx(() {
      if (questionsController.listQuestions.isNotEmpty) {
        //get answer
        listAns = [
          questionsController.listQuestions.elementAt(i).answer1.toString(),
          questionsController.listQuestions.elementAt(i).answer2.toString(),
          questionsController.listQuestions.elementAt(i).answer3.toString(),
          questionsController.listQuestions.elementAt(i).answer4.toString()
        ];
        //shuffle list answer
        answer1 = listAns.elementAt(listIndex.elementAt(0)).toString();
        answer2 = listAns.elementAt(listIndex.elementAt(1)).toString();
        answer3 = listAns.elementAt(listIndex.elementAt(2)).toString();
        answer4 = listAns.elementAt(listIndex.elementAt(3)).toString();
        //get result
        result =
            questionsController.listQuestions.elementAt(i).result.toString();
        //get question
        question =
            questionsController.listQuestions.elementAt(i).question.toString();
        correct =
            questionsController.listQuestions.elementAt(i).correct.toString();

        return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [header(), body()]);
      } else {
        return Container();
      }
    });
  }

  Flexible body() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Flexible(
      flex: 1,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: SizedBox(
          width: width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Đáp án", style: MyFont().header),
              ),
              //choice answer
              isClick == true
                  ? MyButton(
                      padding: 15,
                      text: answer1,
                      color: myColor().ans1,
                      width: width * 0.7,
                      height: height * 0.07,
                      fontSize: 15)
                  : MyButton(
                      padding: 15,
                      text: answer1,
                      color: myColor().ans1,
                      width: width * 0.7,
                      height: height * 0.07,
                      ontap: () {
                        checkResult(answer1, result);
                      },
                      fontSize: 15),
              isClick == true
                  ? MyButton(
                      padding: 15,
                      text: answer2,
                      color: myColor().ans2,
                      width: width * 0.7,
                      height: height * 0.07,
                      fontSize: 15)
                  : MyButton(
                      padding: 15,
                      text: answer2,
                      color: myColor().ans2,
                      width: width * 0.7,
                      height: height * 0.07,
                      ontap: () {
                        checkResult(answer2, result);
                      },
                      fontSize: 15),
              isClick == true
                  ? MyButton(
                      padding: 15,
                      text: answer3,
                      color: myColor().ans3,
                      width: width * 0.7,
                      height: height * 0.07,
                      fontSize: 15)
                  : MyButton(
                      padding: 15,
                      text: answer3,
                      color: myColor().ans3,
                      width: width * 0.7,
                      height: height * 0.07,
                      ontap: () {
                        checkResult(answer3, result);
                      },
                      fontSize: 15),
              isClick == true
                  ? MyButton(
                      padding: 15,
                      text: answer4,
                      color: myColor().ans4,
                      width: width * 0.7,
                      height: height * 0.07,
                      fontSize: 15)
                  : MyButton(
                      padding: 15,
                      text: answer4,
                      color: myColor().ans4,
                      width: width * 0.7,
                      height: height * 0.07,
                      ontap: () {
                        checkResult(answer4, result);
                      },
                      fontSize: 15),
            ],
          ),
        ),
      ),
    );
  }

  Flexible header() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Flexible(
      flex: 1,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 2, top: 2),
                    child: MyButton(
                        padding: 2,
                        ontap: () {
                          questionsController.shuffle();
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.elasticInOut,
                              type: PageTransitionType.leftToRight,
                              child: const Menu(),
                            ),
                          );
                        },
                        color: myColor().exit,
                        width: 30,
                        height: 30,
                        text: "X",
                        fontSize: 13),
                  ),
                  //life
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: heart1,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(
                            "assets/images/heart.png",
                            scale: 1.5,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: heart2,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(
                            "assets/images/heart.png",
                            scale: 1.5,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: heart3,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(
                            "assets/images/heart.png",
                            scale: 1.5,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                color: Colors.black,
                width: width,
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Image.asset(
                    "assets/images/$avatar.png",
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Center(
                  child: Text(
                    "Câu ${i + 1}",
                    style: MyFont().header,
                  ),
                ),
              ),
              Center(
                child: MyInput(
                    width: width * 0.86,
                    height: height * 0.26,
                    color: myColor().board,
                    question: question),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkResult(String answer, String result) {
    //check result
    if (answer == result) {
      playcorrect();
      //add score
      scoreController.addScore();
      Future.delayed(const Duration(milliseconds: 2000), () {
        setState(() {
          //next questions
          i++;
          avatar = image[random.nextInt(image.length)];
          //complete all questions
          if (i == questionsController.listQuestions.length) {
            i = 0;
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.push(
                context,
                PageTransition(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.elasticInOut,
                  type: PageTransitionType.fade,
                  child: const CompletePage(),
                ),
              );
            });
          }
        });
      });
      //show snackbar
      Get.snackbar("", "", snackbarStatus: (status) {
        //is click = true
        if (status == SnackbarStatus.OPENING ||
            status == SnackbarStatus.OPEN ||
            status == SnackbarStatus.CLOSING) {
          setState(() {
            isClick = true;
          });
        }
        //if status == CLOSED
        else if (status == SnackbarStatus.CLOSED) {
          setState(() {
            isClick = false;
          });
        }
      },
          reverseAnimationCurve: Curves.easeInOutBack,
          duration: const Duration(milliseconds: 1500),
          snackPosition: SnackPosition.TOP,
          titleText: Image.asset(
            "assets/images/correct.png",
            width: 100,
            height: 100,
          ),
          messageText:
              Text(correct, textAlign: TextAlign.center, style: MyFont().body),
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
      //sound effect
      playwrong();
      //show life bar   //check result
      setState(() {
        wrong = quotes[randomQuotes.nextInt(quotes.length)];
        life -= 1;
        showLife(life);
      });
      if (life == 0 && isClick == false) {
        scoreController.getResult(result);
        //Game Over
        Future.delayed(const Duration(milliseconds: 2100), () {
          //list rong va diem choi lon hon diem cao nhat
          if (playerController.listPlayer.isEmpty ||
              scoreController.score.toInt() >
                  playerController.listPlayer.elementAt(0).score!) {
            Navigator.push(
              context,
              PageTransition(
                duration: const Duration(milliseconds: 300),
                curve: Curves.elasticInOut,
                type: PageTransitionType.fade,
                child: const AddHighScore(),
              ),
            );
          } else {
            Navigator.push(
              context,
              PageTransition(
                duration: const Duration(milliseconds: 300),
                curve: Curves.elasticInOut,
                type: PageTransitionType.fade,
                child: const GameOver(),
              ),
            );
          }
        });
      }
      //show snackbar
      Get.snackbar("", "", snackbarStatus: (status) {
        //is click = true
        if (status == SnackbarStatus.OPENING ||
            status == SnackbarStatus.OPEN ||
            status == SnackbarStatus.CLOSING) {
          setState(() {
            isClick = true;
          });
        }
        //if status == CLOSED
        else if (status == SnackbarStatus.CLOSED) {
          setState(() {
            isClick = false;
          });
        }
      },
          reverseAnimationCurve: Curves.easeInOutBack,
          duration: const Duration(milliseconds: 1500),
          snackPosition: SnackPosition.TOP,
          titleText: Image.asset(
            "assets/images/wrong.png",
            width: 100,
            height: 100,
          ),
          messageText:
              Text(wrong, textAlign: TextAlign.center, style: MyFont().body),
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
    }
  }

//show lifebar
  void showLife(int life) {
    switch (life) {
      case 1:
        heart1 = true;
        heart2 = false;
        heart3 = false;
        break;
      case 2:
        heart1 = true;
        heart2 = true;
        heart3 = false;
        break;
      case 3:
        heart1 = true;
        heart2 = true;
        heart3 = true;
        break;
      case 0:
        heart1 = false;
        heart2 = false;
        heart3 = false;
        break;
    }
  }
}
