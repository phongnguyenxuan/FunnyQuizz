import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:something/pages/thank_you.dart';
import 'package:something/theme/my_color.dart';
import 'package:something/theme/mybutton.dart';

class CompletePage extends StatefulWidget {
  const CompletePage({super.key});

  @override
  State<CompletePage> createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> {
  late double x1 = -0.8;
  late double x2 = 0.8;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 247, 236),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      width: 320,
                      height: 240,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            const BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 0),
                                spreadRadius: 4),
                            BoxShadow(
                                color: myColor().black,
                                offset: const Offset(0, 0),
                                spreadRadius: 2)
                          ],
                          image: const DecorationImage(
                              image: AssetImage("assets/images/clap.gif"))),
                    ),
                  ),
                  Text('Chúc mừng bạn đã hoàn thành toàn bộ câu hỏi.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.fuzzyBubbles(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black))),
                  const Padding(padding: EdgeInsets.all(10)),
                  Text(
                      "Bạn hãy nhận xét để giúp chúng tôi phát triển hơn nhé !",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.fuzzyBubbles(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)))
                ],
              ),
            ),
            Flexible(
              child: Center(
                child: Stack(
                  children: [
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 100),
                      alignment: Alignment(x1, 0),
                      child: MyButton(
                        ontap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              type: PageTransitionType.fade,
                              child: const ThankYouPage(),
                            ),
                          );
                        },
                        padding: 0,
                        color: myColor().green,
                        width: 150,
                        height: 50,
                        fontSize: 15,
                        text: "Tốt",
                      ),
                    ),
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 100),
                      alignment: Alignment(x2, 0),
                      child: MyButton(
                        ontap: () {
                          setState(() {
                            if (x2 == 0.8) {
                              x1 = 0.8;
                              x2 = -0.8;
                            } else if (x2 == -0.8) {
                              x1 = -0.8;
                              x2 = 0.8;
                            }
                          });
                        },
                        padding: 0,
                        color: myColor().red,
                        width: 150,
                        height: 50,
                        fontSize: 15,
                        text: "Không tốt",
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
