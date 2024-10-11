import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/verification.dart';
import 'package:flutter/material.dart';

class ForgotEmailScr extends StatefulWidget {
  final String? email;
  const ForgotEmailScr({super.key, this.email});

  @override
  State<ForgotEmailScr> createState() => _ForgotEmailScrState();
}

class _ForgotEmailScrState extends State<ForgotEmailScr> {
  // <<<<<<<Controller >>>>>>

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: size.width * 0.50,
        leading: InkWell(
          radius: 50,
          onTap: () {
            Navigator.pop(context);
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios_new,
                  color: MyColor.black,
                  size: 20,
                ),
                Text(
                  "  ${Language().forgotPassword}",
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(width: size.width * 0.80, ImageAsset.emaillogo),
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Language().youremailisontheway.toString(),
                  style: const TextStyle(
                    color: MyColor.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    fontFamily: Fonts.vietna,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Check your email ${widget.email} and follow \nthe instructions to reset your password",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: MyColor.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    fontFamily: Fonts.vietna,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Language().didntreceivedanymail,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: Fonts.vietna,
                    color: MyColor.litegray,
                  ),
                ),
                InkWell(
                  radius: 50,
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             const Registredscr()));
                  },
                  child: Text(
                    Language().resend,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: Fonts.vietna,
                      color: MyColor.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.35,
            ),
            SizedBox(
              width: size.width * 0.95,
              height: 55,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColor.blue,
                    // surfaceTintColor: MyColor.white,
                    overlayColor: MyColor.liteyellow,
                    enableFeedback: true,

                    enabledMouseCursor: MouseCursor.defer,
                    // Background color
                    // Text color (alternative)
                    elevation: 5, // Optional: elevation (shadow)
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10), // Custom padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(34), // Custom shape
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerificationScr(
                                  email: widget.email,
                                )));
                  },
                  child: Text(
                    Language().enterOTP.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: Fonts.vietna,
                      color: MyColor.white,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
