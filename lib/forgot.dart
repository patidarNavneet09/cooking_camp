import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/forgotemail.dart';
import 'package:flutter/material.dart';

class ForgotScr extends StatefulWidget {
  const ForgotScr({super.key});

  @override
  State<ForgotScr> createState() => _ForgotScrState();
}

class _ForgotScrState extends State<ForgotScr> {
  // <<<<<<<Controller >>>>>>

  TextEditingController emailController = TextEditingController();

  dynamic _isFocusedcolor = '';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: size.width * 0.50,
        leading: InkWell(
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
            Text(
              Language().dontworryEnteryouremail,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontFamily: Fonts.vietna,
                color: MyColor.black,
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Text(
              Language().email.toString(),
              style: const TextStyle(
                color: MyColor.black,
                fontWeight: FontWeight.w300,
                fontSize: 15,
                fontFamily: Fonts.vietna,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: _isFocusedcolor == "firstName"
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
                  _isFocusedcolor = "firstName";
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
                controller: emailController,

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
                  hintText: Language().enterEmail.toString(),
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
              height: size.height * 0.10,
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
                            builder: (context) => ForgotEmailScr(
                                  email: emailController.text.toString(),
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
      ),
    );
  }
}
