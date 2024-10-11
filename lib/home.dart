import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:flutter/material.dart';

class HomeScr extends StatefulWidget {
  const HomeScr({super.key});

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: MyColor.yellowF6F1E1,
        toolbarHeight: 108,
        backgroundColor: MyColor.yellowF6F1E1,
        leadingWidth: size.width * 0.80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 33,
                child: Image.asset(ImageAsset.image),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hey, Ronald",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: Fonts.vietna,
                        color: MyColor.blue,
                      ),
                    ),
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: Fonts.vietna,
                        color: MyColor.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Image.asset(height: 42, ImageAsset.bellpng),
          )
        ],
      ),
    );
  }
}
