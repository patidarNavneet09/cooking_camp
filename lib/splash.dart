import 'dart:async';

import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/dashboard.dart';
import 'package:cooking_champs/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScr extends StatefulWidget {
  const SplashScr({super.key});

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      checklogiin();
    });
  }

  checklogiin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    bool? islogin = sharedPreferences.getBool("isLogin");
    // bool? onboarding = sharedPreferences.getBool("OnBoarding");

    setState(() {});
    if (islogin.toString() != "null" && islogin != false || islogin == true) {
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => const DashBoardScr(
                      pageIndex: 0,
                    )),
            (Route<dynamic> route) => false);
      }
      setState(() {});
    }
    //  else if (onboarding.toString() == 'null' || onboarding == false) {
    //   Timer(
    //       const Duration(seconds: 2),
    //       () => Navigator.pushReplacement(context,
    //           MaterialPageRoute(builder: (context) => const OnBoardingView())));

    //   setState(() {});
    // }
    else {
      Timer(
          const Duration(seconds: 2),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Loginscr())));

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColor.blue,
      body: Center(
        child:
            Image.asset(width: size.width * 0.50, height: 111, ImageAsset.logo),
      ),
    );
  }
}
