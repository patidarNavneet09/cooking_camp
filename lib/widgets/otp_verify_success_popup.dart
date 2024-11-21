import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/views/authentication/reset_password_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OtpVerifySuccessfullyPopup extends StatefulWidget {
  final String email;
  const OtpVerifySuccessfullyPopup({super.key,required this.email});

  @override
  State<OtpVerifySuccessfullyPopup> createState() => _OtpVerifySuccessfullyPopupState();
}

class _OtpVerifySuccessfullyPopupState extends State<OtpVerifySuccessfullyPopup> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final size = data.size;
    return  MediaQuery(data: data,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        child: Lottie.asset(
                          'assets/images/CookingChamp.json',
                          height: MediaQuery.of(context).size.height * 0.17,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Text(
                        Languages.of(context)!.oTPVerified,
                        style: const TextStyle(
                          color: MyColor.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          fontFamily: Fonts.beVietnamProRegular,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        Languages.of(context)!.yourOTPhasbeensuccessfullyverified,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: MyColor.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          fontFamily: Fonts.beVietnamProRegular,
                        ),
                      ),

                      SizedBox(
                        height: size.height * 0.03,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom:20.0,left: 10,right: 10),
                        child: GlobalButton(Languages.of(context)!.continuee.toString(), MyColor.appTheme, MyColor.appTheme, btnSize55,double.infinity, continueOnTap, 55, 5,0, mediumTextStyle(fontSize:16.0, color:MyColor.white)),
                      )

                    ],
                  ),
                ),
              ],
            )
        ));
  }

  void continueOnTap() {
    CustomNavigators.pushRemoveUntil(ResetPasswordView(email: widget.email,), context);
  }

}
