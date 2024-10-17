import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class AddYourStoriesScr extends StatefulWidget {
  const AddYourStoriesScr({super.key});

  @override
  State<AddYourStoriesScr> createState() => _AddYourStoriesScrState();
}

class _AddYourStoriesScrState extends State<AddYourStoriesScr> {
  dynamic _isFocusedcolor = '';

  // <<<<<<<Controller >>>>>>

  TextEditingController entertitleController = TextEditingController();
  TextEditingController writehereController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        automaticallyImplyLeading: false,
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
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(
                  //       builder: (context) => const DashBoardScr(
                  //             pageIndex: 0,
                  //           )),
                  // );
                  // istabExplore = false;
                  setState(() {});
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              Text(
                Language().addYourStories,
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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Language().addarecentmoment,
                      style: const TextStyle(
                        color: MyColor.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        fontFamily: Fonts.vietna,
                      ),
                    ),
                    Text(
                      Language().openyourphotogalleryto,
                      style: const TextStyle(
                        color: MyColor.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        fontFamily: Fonts.vietna,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DottedBorder(
                            color: MyColor.blue,
                            strokeWidth: 2,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10),
                            dashPattern: const [02, 10],
                            child: TouchRippleEffect(
                              backgroundColor: Colors.transparent,

                              // focusColor: Colors.amber,
                              // splashColor: Colors.blue,
                              // hoverColor: Colors.red,
                              // highlightColor: Colors.pink,

                              borderRadius: BorderRadius.circular(10),
                              rippleColor: MyColor.blue.withOpacity(0.8),
                              onTap: () {},
                              child: Container(
                                  height: size.height * 0.19,
                                  width: size.width * 0.40,
                                  decoration: const BoxDecoration(
                                    color: MyColor.yellowF6F1E1,
                                  ),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          width: 35,
                                          height: 35,
                                          ImageAsset.addimage),
                                      Text(
                                        Language().addImage,
                                        style: const TextStyle(
                                          color: MyColor.blue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          fontFamily: Fonts.vietna,
                                        ),
                                      ),
                                    ],
                                  ))),
                            )),
                        DottedBorder(
                            color: MyColor.blue,
                            strokeWidth: 2,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10),
                            dashPattern: const [02, 10],
                            child: TouchRippleEffect(
                              backgroundColor: Colors.transparent,

                              // focusColor: Colors.amber,
                              // splashColor: Colors.blue,
                              // hoverColor: Colors.red,
                              // highlightColor: Colors.pink,

                              borderRadius: BorderRadius.circular(10),
                              rippleColor: MyColor.blue.withOpacity(0.8),
                              onTap: () {},
                              child: Container(
                                  height: size.height * 0.19,
                                  width: size.width * 0.40,
                                  decoration: const BoxDecoration(
                                    color: MyColor.yellowF6F1E1,
                                  ),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          width: 35,
                                          height: 35,
                                          ImageAsset.addimage),
                                      Text(
                                        Language().addImage,
                                        style: const TextStyle(
                                          color: MyColor.blue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          fontFamily: Fonts.vietna,
                                        ),
                                      ),
                                    ],
                                  ))),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Language().momentStoryTitle,
                          style: const TextStyle(
                            color: MyColor.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            fontFamily: Fonts.vietna,
                          ),
                        ),
                        Text(
                          Language().max30Words,
                          style: const TextStyle(
                            color: MyColor.blue,
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            fontFamily: Fonts.vietna,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: _isFocusedcolor == "Enter title"
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
                          _isFocusedcolor = "Enter title";
                        },
                        maxLength: 30,
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
                        controller: entertitleController,

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
                          hintText: Language().entertitle.toString(),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Language().yourStoryMoment,
                          style: const TextStyle(
                            color: MyColor.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            fontFamily: Fonts.vietna,
                          ),
                        ),
                        Text(
                          Language().min200Words,
                          style: const TextStyle(
                            color: MyColor.blue,
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            fontFamily: Fonts.vietna,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: _isFocusedcolor == "writehere"
                                ? MyColor.liteyellow
                                : MyColor.graylite),
                        color: MyColor.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(12, 5, 0, 15),
                      height: 165,
                      child: TextField(
                        minLines: 200,
                        textCapitalization: TextCapitalization.sentences,
                        onTap: () {
                          _isFocusedcolor = "writehere";
                        },
                        // maxLength: 200,
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
                        controller: writehereController,

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
                          hintText: Language().writehere.toString(),
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
                        maxLines: 10000,
                        cursorColor: MyColor.black,
                      ),
                    ),
                  ],
                ),
              ),
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
                    // Navigator.of(context).pushAndRemoveUntil(
                    //     MaterialPageRoute(
                    //         builder: (context) => const DashBoardScr(
                    //               pageIndex: 0,
                    //             )),
                    //     (Route<dynamic> route) => false);
                  },
                  child: Text(
                    Language().add.toString(),
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
