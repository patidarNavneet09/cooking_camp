import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class SafetykitenScr extends StatefulWidget {
  const SafetykitenScr({super.key});

  @override
  State<SafetykitenScr> createState() => _SafetykitenScrState();
}

class _SafetykitenScrState extends State<SafetykitenScr> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MyColor.orange,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    // margin: EdgeInsets.only(bottom: 1),
                    width: size.width,
                    height: size.height * 0.15,
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          ImageAsset.whitesamallroundedback,
                          fit: BoxFit.contain,
                        ),
                      ],
                    )),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.06,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TouchRippleEffect(
                        // focusColor: Colors.amber,
                        // splashColor: Colors.blue,
                        // hoverColor: Colors.red,
                        // highlightColor: Colors.pink,

                        borderRadius: BorderRadius.circular(30),
                        rippleColor: Colors.white,
                        onTap: () {
                          Navigator.pop(context);
                          // Navigator.of(context).pushReplacement(
                          //   MaterialPageRoute(
                          //       builder: (context) => const DashBoardScr(
                          //             pageIndex: 0,
                          //           )),
                          // );
                          pageIndex = 4;
                          istabExplore = true;
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        Language().safetyinthekitchen,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: Fonts.vietna,
                          color: MyColor.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
