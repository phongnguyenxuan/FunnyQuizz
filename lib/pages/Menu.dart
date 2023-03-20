// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:something/pages/Rank.dart';
import 'package:something/pages/home_page.dart';
import 'package:something/theme/my_color.dart';
import 'package:something/theme/my_font.dart';
import 'package:something/theme/mybutton.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _menuState();
}

// ignore: camel_case_types
class _menuState extends State<Menu> {
  final String _faceUrl = "https://www.facebook.com/Anhphongggg";
  // ignore: unused_field
  final String _igUrl = "https://www.instagram.com/phongden_2210/";
  final String _disCordUrl = "https://github.com/phongnguyenxuangit";
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
            //  crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 5,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/images/logo.png"),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("Đố Vui", style: MyFont().header),
                        ),
                        MyButton(
                          padding: 15,
                          fontSize: 18,
                          width: 200,
                          height: 60,
                          color: myColor().green,
                          text: "Chơi",
                          ontap: () {
                            _play();
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: MyButton(
                            padding: 15,
                            fontSize: 18,
                            width: 200,
                            height: 60,
                            color: myColor().orange,
                            text: "Xếp hạng",
                            ontap: () {
                              _rank();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: MyButton(
                            padding: 15,
                            fontSize: 18,
                            width: 200,
                            height: 60,
                            color: myColor().red,
                            text: "Thoát",
                            ontap: () {
                              _quit();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: //contact us
                      FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 2,
                            color: Colors.black,
                          ),
                          Text("Contact me", style: MyFont().footage),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _launchFacebook();
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.facebookF,
                                    size: 20,
                                    color: Colors.black,
                                  )),
                              IconButton(
                                  onPressed: () async {
                                    _launchInsta();
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.instagram,
                                    size: 20,
                                    color: Colors.black,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    _launchDiscord();
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.github,
                                    size: 20,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                          Text("Made by @Phong_chim", style: MyFont().footage)
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  _launchFacebook() async {
    try {
      if (await canLaunchUrlString(_faceUrl)) {
        await launchUrlString(_faceUrl, mode: LaunchMode.inAppWebView);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _launchInsta() async {
    try {
      if (await canLaunchUrlString(_igUrl)) {
        launchUrlString(_igUrl, mode: LaunchMode.inAppWebView);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _launchDiscord() async {
    try {
      if (await canLaunchUrlString(_disCordUrl)) {
        launchUrlString(_disCordUrl, mode: LaunchMode.inAppWebView);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _play() {
    Navigator.push(
      context,
      PageTransition(
        duration: const Duration(milliseconds: 300),
        curve: Curves.elasticInOut,
        type: PageTransitionType.rightToLeft,
        child: const MyHomePage(),
      ),
    );
  }

  _rank() {
    Navigator.push(
      context,
      PageTransition(
        duration: const Duration(milliseconds: 300),
        curve: Curves.elasticInOut,
        type: PageTransitionType.bottomToTop,
        child: const Rank(),
      ),
    );
  }

  _quit() {
    exit(0);
  }
}
