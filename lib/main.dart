import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cooking Champs',
      theme: ThemeData(
        scaffoldBackgroundColor: MyColor.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const SplashScr(),
    );
  }
}
