import 'dart:async';
import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/services/user_prefences.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/views/dashboard.dart';
import 'package:cooking_champs/views/authentication/login_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),checkLogin);
  }

  checkLogin() async {
    var isLogin = await PreferencesServices.getPreferencesData(PreferencesServices.isLogin);
    var deviceId = await PreferencesServices.getPreferencesData(PreferencesServices.deviceId);
    setState(() {});

    if (isLogin != null && isLogin != false || isLogin == true) {
      if (mounted) {
        CustomNavigators.pushRemoveUntil(DashBoardView(pageIndex: 0,), context);
      }

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
              MaterialPageRoute(builder: (context) => const LoginView())));


    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColor.appTheme,
      body: Center(
        child:
            Image.asset(width: size.width * 0.50, height: 111, AssetsPath.logo),
      ),
    );
  }
}
