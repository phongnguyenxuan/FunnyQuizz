import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:something/pages/Rank.dart';
import 'package:something/pages/home_page.dart';
import 'package:something/theme/mybutton.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _menuState();
}

class _menuState extends State<Menu> {
  final String _faceUrl = "https://www.facebook.com/Anhphongggg";
  final String _IgUrl = "https://www.instagram.com/phongden_2210/";
  final String _disCordUrl = "https://github.com/phongnguyenxuan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 2)),
          child: Column(
            children: <Widget>[
              const Spacer(
                flex: 1,
              ),
              Text("Let's Math",
                  style: GoogleFonts.fuzzyBubbles(
                      textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.black))),
              const Spacer(
                flex: 1,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: MyButton(
                  text: "Play",
                  ontap: _play,
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MyButton(text: "Rank", ontap: _rank),
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MyButton(
                    text: "Quit",
                    ontap: _quit,
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              const Divider(
                height: 15,
                thickness: 2,
                indent: 10,
                endIndent: 10,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Text("Contact us",
                        style: GoogleFonts.fuzzyBubbles(
                            textStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.black))),
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
                    Text("Made by @Phong_chim",
                        style: GoogleFonts.fuzzyBubbles(
                            textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.black)))
                  ],
                ),
              )
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
      print(e);
    }
  }

  _launchInsta() async {
    try {
      if (await canLaunchUrlString(_IgUrl)) {
        launchUrlString(_IgUrl, mode: LaunchMode.inAppWebView);
      }
    } catch (e) {
      print(e);
    }
  }

  _launchDiscord() async {
    try {
      if (await canLaunchUrlString(_disCordUrl)) {
        launchUrlString(_disCordUrl, mode: LaunchMode.inAppWebView);
      }
    } catch (e) {
      print(e);
    }
  }

  _play() {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.bottomToTop,
        child: const MyHomePage(),
      ),
    );
  }

  _rank() {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.bottomToTop,
        child: const Rank(),
      ),
    );
  }

  _quit() {
    exit(0);
  }
}
