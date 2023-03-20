import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:something/pages/Menu.dart';
import 'package:something/theme/my_color.dart';
import 'package:something/theme/mybutton.dart';

class ThankYouPage extends StatefulWidget {
  const ThankYouPage({super.key});

  @override
  State<ThankYouPage> createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
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
                        image: AssetImage("assets/images/thank.gif"))),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: MyButton(
                    ontap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          type: PageTransitionType.fade,
                          child: const Menu(),
                        ),
                      );
                    },
                    color: myColor().exit,
                    width: 150,
                    height: 60,
                    fontSize: 15,
                    text: "Trang chủ",
                    padding: 0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
