import 'package:cooking_champs/constant/app_state.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/model/post_model/login_request_model.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/services/user_prefences.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/utility.dart';
import 'package:cooking_champs/views/authentication/login_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constant/my_color.dart';

class ChangePasswordPopup extends StatefulWidget {
  final String title;
  final String des;
  final String img;
  final String btnName;
  final GestureTapCallback onTap;
  const ChangePasswordPopup({super.key,required this.title,required this.des,required this.img,required this.btnName,required this.onTap,});

  @override
  State<ChangePasswordPopup> createState() => _ChangePasswordPopupState();
}

class _ChangePasswordPopupState extends State<ChangePasswordPopup> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final size = data.size;
    return MediaQuery(
        data: data.copyWith(textScaleFactor: 1.0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,

          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20,15,20,20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Wrap(
                  children: [
                    Container(
                      child: Lottie.asset(
                        widget.img,
                        height: MediaQuery.of(context)
                            .size
                            .height *
                            0.17,
                        width: MediaQuery.of(context)
                            .size
                            .width,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom:5.0),
                      child: Text(
                       widget.title,
                        textAlign: TextAlign.center,
                        style:mediumTextStyle(fontSize:20.0, color: MyColor.black)
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom:25.0),
                      child: Text(
                        widget.des,
                        textAlign: TextAlign.center,
                        style: regularTextStyle(fontSize:15.0, color: MyColor.black)
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom:10.0,left: 10,right: 10,top:15),
                      child: GlobalButton(widget.btnName, MyColor.appTheme, MyColor.appTheme, btnSize55,double.infinity, widget.onTap, 55, 5,0, mediumTextStyle(fontSize:16.0, color:MyColor.white)),
                    ),
              /*      SizedBox(
                      width: size.width * 0.95,
                      height: 55,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColor.appTheme,
                            // surfaceTintColor: MyColor.white,
                            overlayColor:
                            MyColor.liteYellow,
                            enableFeedback: true,

                            enabledMouseCursor:
                            MouseCursor.defer,
                            // Background color
                            // Text color (alternative)
                            elevation:
                            5, // Optional: elevation (shadow)
                            padding: const EdgeInsets
                                .symmetric(
                                horizontal: 20,
                                vertical:
                                10), // Custom padding
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(
                                  34), // Custom shape
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const LoginView()),
                                    (Route<dynamic>
                                route) =>
                                false);
                          },
                          child: Text(
                            Languages.of(context)!.gotoLogin.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: Fonts.beVietnamProRegular,
                              color: MyColor.white,
                            ),
                          )),
                    ),*/
                  ],
                ),
              ),
            ],
          ),
        ));
  }


}
