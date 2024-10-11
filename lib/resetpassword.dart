import 'package:cooking_champs/login.dart';
import 'package:lottie/lottie.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:flutter/material.dart';

class ResetPasswordScr extends StatefulWidget {
  final String? email;
  const ResetPasswordScr({super.key, this.email});

  @override
  State<ResetPasswordScr> createState() => _ResetPasswordScrState();
}

class _ResetPasswordScrState extends State<ResetPasswordScr> {
  final formKey = GlobalKey<FormState>();

  // <<<<<<<Controller >>>>>>

  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimpasswordController = TextEditingController();
  dynamic _isFocusedcolor = '';
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
                  "  ${Language().resetPassword}",
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
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        Language().newPassword.toString(),
                        style: const TextStyle(
                          color: MyColor.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          fontFamily: Fonts.vietna,
                        ),
                      ),
                      const Text(
                        " *",
                        style: TextStyle(
                          color: MyColor.red,
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          fontFamily: Fonts.vietna,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: _isFocusedcolor == "enterpassword"
                              ? MyColor.liteyellow
                              : MyColor.graylite),
                      color: MyColor.white,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(12, 5, 0, 15),
                    height: 55,
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      onTap: () {
                        _isFocusedcolor = "enterpassword";
                      },
                      // textInputAction: TextInputAction.next,
                      onEditingComplete: () {
                        // String input = phoneController.text;
                        // if (input.isNotEmpty && input.length == 10) {
                        //   loginApi(context, input, countrycode, devicetype,
                        //       devicetoken);
                        // }
                      },

                      buildCounter: (BuildContext context,
                              {required int currentLength,
                              int? maxLength,
                              required bool isFocused}) =>
                          null,
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      // ],
                      controller: passwordController,

                      textInputAction: TextInputAction.next,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: Fonts.vietna,
                        color: MyColor.black,
                      ),
                      // obscureText: _obscureTextpassword,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: Language().enterpassword.toString(),
                        // suffixIcon: Padding(
                        //   padding: const EdgeInsets.only(bottom: 2),
                        //   child: IconButton(
                        //     icon: Icon(
                        //       _obscureTextpassword
                        //           ? Icons.visibility_off
                        //           : Icons.visibility,
                        //       color: MyColor.grayeye,
                        //       size: 25,
                        //     ),
                        //     onPressed: () {
                        //       setState(() {
                        //         _obscureTextpassword = !_obscureTextpassword;
                        //       });
                        //     },
                        //   ),
                        // ),
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: MyColor.graylite1,
                          fontFamily: Fonts.vietna,
                        ),
                        counter: const Offstage(),
                        isDense: true,
                        // this will remove the default content padding
                        contentPadding: const EdgeInsets.only(
                          top: 10,
                        ),
                      ),
                      maxLines: 1,
                      cursorColor: MyColor.black,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    children: [
                      Text(
                        Language().confirmnewPassword.toString(),
                        style: const TextStyle(
                          color: MyColor.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          fontFamily: Fonts.vietna,
                        ),
                      ),
                      const Text(
                        " *",
                        style: TextStyle(
                          color: MyColor.red,
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          fontFamily: Fonts.vietna,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: _isFocusedcolor == "confrimpasswordController"
                              ? MyColor.liteyellow
                              : MyColor.graylite),
                      color: MyColor.white,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(12, 5, 0, 15),
                    height: 55,
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      onTap: () {
                        _isFocusedcolor = "confrimpasswordController";
                      },
                      // textInputAction: TextInputAction.next,
                      onEditingComplete: () {
                        // String input = phoneController.text;
                        // if (input.isNotEmpty && input.length == 10) {
                        //   loginApi(context, input, countrycode, devicetype,
                        //       devicetoken);
                        // }
                      },

                      buildCounter: (BuildContext context,
                              {required int currentLength,
                              int? maxLength,
                              required bool isFocused}) =>
                          null,
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      // ],
                      controller: confrimpasswordController,

                      textInputAction: TextInputAction.next,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: Fonts.vietna,
                        color: MyColor.black,
                      ),
                      // obscureText: _obscureTextpassword,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: Language().enterpassword.toString(),
                        // suffixIcon: Padding(
                        //   padding: const EdgeInsets.only(bottom: 2),
                        //   child: IconButton(
                        //     icon: Icon(
                        //       _obscureTextpassword
                        //           ? Icons.visibility_off
                        //           : Icons.visibility,
                        //       color: MyColor.grayeye,
                        //       size: 25,
                        //     ),
                        //     onPressed: () {
                        //       setState(() {
                        //         _obscureTextpassword = !_obscureTextpassword;
                        //       });
                        //     },
                        //   ),
                        // ),
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: MyColor.graylite1,
                          fontFamily: Fonts.vietna,
                        ),
                        counter: const Offstage(),
                        isDense: true,
                        // this will remove the default content padding
                        contentPadding: const EdgeInsets.only(
                          top: 10,
                        ),
                      ),
                      maxLines: 1,
                      cursorColor: MyColor.black,
                    ),
                  ),
                ],
              ),
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
                                    height: size.height * 0.38,
                                    width: size.width * 0.90,
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Lottie.asset(
                                            'assets/images/PasswordChangeCooking.json',
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.17,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                        ),
                                        Text(
                                          Language().passwordchanged,
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
                                              .yourpasswordhasbeensuccessfullyreset,
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
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const Loginscr()),
                                                        (Route<dynamic>
                                                                route) =>
                                                            false);
                                              },
                                              child: Text(
                                                Language().gotoLogin.toString(),
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
