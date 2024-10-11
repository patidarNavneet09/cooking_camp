import 'package:cooking_champs/resetpassword.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:flutter/material.dart';

class VerificationScr extends StatefulWidget {
  final String? email;
  const VerificationScr({super.key, this.email});

  @override
  State<VerificationScr> createState() => _VerificationScrState();
}

class _VerificationScrState extends State<VerificationScr> {
  final formKey = GlobalKey<FormState>();

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
                  "  ${Language().verification}",
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Language().enterOTPCode.toString(),
                  style: const TextStyle(
                    color: MyColor.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    fontFamily: Fonts.vietna,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  "We have sent the code verification to your email ${widget.email}.",
                  style: const TextStyle(
                    color: MyColor.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    fontFamily: Fonts.vietna,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Form(
                  key: formKey,
                  child: SizedBox(
                    width: size.width * 0.90,
                    // width: 300,
                    child: PinCodeTextField(
                      cursorColor: Colors.black,
                      cursorHeight: 17,
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Quicksand"),
                      autoFocus: false,
                      appContext: context,
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        inactiveColor: MyColor.otpcolr,
                        errorBorderColor: Colors.white,
                        disabledColor: MyColor.white,
                        activeColor: MyColor.blue,
                        selectedColor: MyColor.otpcolr,
                        selectedFillColor: MyColor.liteyellowotp,
                        inactiveFillColor: MyColor.liteyellowotp,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        fieldHeight: 70,
                        fieldWidth: 74,
                        activeFillColor: Colors.white,
                      ),
                      animationDuration: const Duration(milliseconds: 500),
                      enableActiveFill: true,
                      controller: emailController,
                      keyboardType: TextInputType.number,
                      onCompleted: (pin) {
                        // setState(() {
                        //   comp1 = pin;
                        // });
                      },
                      onChanged: (pin2) {
                        // setState(() {
                        //   comp = pin2.length;
                        // });
                      },
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
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
                          borderRadius:
                              BorderRadius.circular(34), // Custom shape
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(25.0))),
                                content: Builder(builder: (context) {
                                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                  var size = MediaQuery.of(context).size;

                                  return SizedBox(
                                    height: size.height * 0.42,
                                    width: size.width * 0.90,
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Lottie.asset(
                                            'assets/images/CookingChamp.json',
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.20,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                        ),
                                        Text(
                                          Language().oTPVerified,
                                          style: const TextStyle(
                                            color: MyColor.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            fontFamily: Fonts.vietna,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Text(
                                          Language()
                                              .yourOTPhasbeensuccessfullyverified,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: MyColor.black,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 15,
                                            fontFamily: Fonts.vietna,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.03,
                                        ),
                                        SizedBox(
                                          width: size.width * 0.95,
                                          height: 55,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: MyColor.blue,
                                                // surfaceTintColor: MyColor.white,
                                                overlayColor:
                                                    MyColor.liteyellow,
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
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ResetPasswordScr(
                                                              email:
                                                                  widget.email,
                                                            )));
                                              },
                                              child: Text(
                                                Language().continuee.toString(),
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
                                  );
                                })));
                      },
                      child: Text(
                        Language().submit.toString(),
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
          ],
        ),
      ),
    );
  }
}
