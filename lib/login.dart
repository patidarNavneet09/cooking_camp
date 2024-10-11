import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/forgot.dart';
import 'package:cooking_champs/registredscr.dart';
import 'package:flutter/material.dart';

class Loginscr extends StatefulWidget {
  const Loginscr({super.key});

  @override
  State<Loginscr> createState() => _LoginscrState();
}

class _LoginscrState extends State<Loginscr> {
  // <<<<<<<Controller >>>>>>

  TextEditingController fullnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Image.asset(
                    ImageAsset.loginbackground,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.20,
                    ),
                    Image.asset(
                      width: size.width * 0.46,
                      height: size.height * 0.15,
                      ImageAsset.antapanta,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 0,
                        shadowColor: MyColor.yello,
                        color: MyColor.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(34.0),
                          side: BorderSide.none,
                        ),
                        child: TextFormField(
                          textCapitalization: TextCapitalization.sentences,
                          onTap: () {
                            // _isFocusedcolor = "Full name";
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
                          controller: fullnameController,
                          // obscureText: obscureTextEmail,
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: Fonts.vietna,
                            color: MyColor.black,
                          ),

                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(34)),
                              borderSide: BorderSide(
                                  color: MyColor.liteyellow, width: 0.1),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(34)),
                              borderSide: BorderSide(
                                  color: MyColor.liteyellow, width: 2.0),
                            ),
                            disabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(34)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 199, 152, 124),
                                  width: 2.0),
                            ),
                            // hintText: _isFocusedcolor == "Full name"
                            //     ? ""
                            //     : "AppStrings.email",
                            labelText: Language().full.toString(),
                            alignLabelWithHint: true,
                            // hintStyle:
                            //     TextStyle(color: AppColors.primaryColorLight),
                          ),
                          maxLines: 1,
                          cursorColor: MyColor.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.001,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 0,
                        shadowColor: MyColor.yello,
                        color: MyColor.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(34.0),
                          side: BorderSide.none,
                        ),
                        child: TextFormField(
                          textCapitalization: TextCapitalization.sentences,
                          onTap: () {
                            // _isFocusedcolor = "password";
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
                          controller: passwordController,
                          // obscureText: obscureTextEmail,
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: Fonts.vietna,
                            color: MyColor.black,
                          ),

                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(34)),
                              borderSide: BorderSide(
                                  color: MyColor.liteyellow, width: 0.1),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(34)),
                              borderSide: BorderSide(
                                  color: MyColor.liteyellow, width: 2.0),
                            ),
                            disabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(34)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 199, 152, 124),
                                  width: 2.0),
                            ),
                            // hintText: _isFocusedcolor == "Full name"
                            //     ? ""
                            //     : "AppStrings.email",
                            labelText: Language().password.toString(),
                            alignLabelWithHint: true,
                            // hintStyle:
                            //     TextStyle(color: AppColors.primaryColorLight),
                          ),
                          maxLines: 1,
                          cursorColor: MyColor.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
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
                              borderRadius:
                                  BorderRadius.circular(34), // Custom shape
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            Language().login.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: Fonts.vietna,
                              color: MyColor.white,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    InkWell(
                      radius: 50,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotScr()));
                      },
                      child: Text(
                        Language().forgotPassword,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: Fonts.vietna,
                          color: MyColor.litegray,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Wrap(
                      children: [
                        Text(
                          Language().donthaveanacco,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Registredscr()));
                          },
                          child: Text(
                            Language().signUp,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: Fonts.vietna,
                              color: MyColor.blue,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
