import 'dart:io';
import 'package:cooking_champs/dashboard.dart';
import 'package:cooking_champs/login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class ChangePasswordscr extends StatefulWidget {
  const ChangePasswordscr({super.key});

  @override
  State<ChangePasswordscr> createState() => _ChangePasswordscrState();
}

class _ChangePasswordscrState extends State<ChangePasswordscr> {
  // <<<<<<<Controller >>>>>>

  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmnewPassController = TextEditingController();

  //// <<<<<<<<<<<   Focous node >>>>>>>>>

  dynamic _isFocusedcolor = '';

  File? selectedImage1;
  List<XFile> imageFileList = [];
  dynamic image1;

  String base64Image = "";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // // foregroundColor: MyColor.liteyellow,
        // backgroundColor: MyColor.liteyellow,
        // scrolledUnderElevation: 0,
        // shadowColor: MyColor.liteyellow,
        // elevation: 0,
        // surfaceTintColor: MyColor.liteyellow,
        // toolbarHeight: 50,
        // leadingWidth: size.width * 0.80,
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: 20),
        //   child: Row(
        //     children: [
        //       Icon(
        //         Icons.arrow_back_ios,
        //         size: 30,
        //         color: Colors.black,
        //       ),
        //       Text(
        //         widget.name.toString(),
        //         style: TextStyle(
        //           fontSize: 18,
        //           fontWeight: FontWeight.w500,
        //           fontFamily: Fonts.vietna,
        //           color: MyColor.black,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        leadingWidth: 0, automaticallyImplyLeading: false,
        backgroundColor: MyColor.yellowF6F1E1,
        surfaceTintColor: MyColor.yellowF6F1E1,
        title: Padding(
          padding: const EdgeInsets.only(left: 0),
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
                  setState(() {});
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              Text(
                Language().changePassword,
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
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
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
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
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
                            color: _isFocusedcolor == "newpassword"
                                ? MyColor.liteyellow
                                : MyColor.graylite),
                        color: MyColor.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(12, 5, 0, 15),
                      height: 55,
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        onTap: () {
                          _isFocusedcolor = "newpassword";
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
                        controller: newpasswordController,

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
                      height: size.height * 0.02,
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
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
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
                            color: _isFocusedcolor == "confirmnewPassword"
                                ? MyColor.liteyellow
                                : MyColor.graylite),
                        color: MyColor.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(12, 5, 0, 15),
                      height: 55,
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        onTap: () {
                          _isFocusedcolor = "confirmnewPassword";
                          setState(() {});
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
                        controller: confirmnewPassController,

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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                        borderRadius: BorderRadius.circular(34), // Custom shape
                      ),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => VerificationScr(
                      //               email: widget.email,
                      //             )));
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0))),
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
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                              overlayColor: MyColor.liteyellow,
                                              enableFeedback: true,

                                              enabledMouseCursor:
                                                  MouseCursor.defer,
                                              // Background color
                                              // Text color (alternative)
                                              elevation:
                                                  5, // Optional: elevation (shadow)
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                              const DashBoardScr(
                                                                pageIndex: 0,
                                                              )),
                                                      (Route<dynamic> route) =>
                                                          false);
                                              setState(() {});
                                            },
                                            child: Text(
                                              Language().gotoHome.toString(),
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
                      Language().savePassword.toString(),
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
    );
  }
}
