import 'dart:convert';
import 'dart:io';

import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class AddYourStoriesScr extends StatefulWidget {
  const AddYourStoriesScr({super.key});

  @override
  State<AddYourStoriesScr> createState() => _AddYourStoriesScrState();
}

class _AddYourStoriesScrState extends State<AddYourStoriesScr> {
  List<XFile> imageFileList = [];
  dynamic image1;
  File? selectedImage1;
  File? selectedImage2;
  String base64Image = "";

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
                            dashPattern: selectedImage1 != null
                                ? [200, 0]
                                : const [02, 10],
                            child: TouchRippleEffect(
                              backgroundColor: Colors.transparent,

                              // focusColor: Colors.amber,
                              // splashColor: Colors.blue,
                              // hoverColor: Colors.red,
                              // highlightColor: Colors.pink,

                              borderRadius: BorderRadius.circular(10),
                              rippleColor: MyColor.blue.withOpacity(0.8),
                              onTap: () {
                                showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                      // <-- SEE HERE
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20.0),
                                      ),
                                    ),
                                    context: context,
                                    builder: ((builder) =>
                                        bottomSheet1("One")));
                              },
                              child: selectedImage1 != null
                                  ? Container(
                                      height: size.height * 0.19,
                                      width: size.width * 0.40,
                                      decoration: const BoxDecoration(
                                        color: MyColor.yellowF6F1E1,
                                      ),
                                      child: Image.file(
                                        selectedImage1!,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Container(
                                      height: size.height * 0.19,
                                      width: size.width * 0.40,
                                      decoration: const BoxDecoration(
                                        color: MyColor.yellowF6F1E1,
                                      ),
                                      child: Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                            dashPattern: selectedImage2 != null
                                ? [200, 0]
                                : const [02, 10],
                            child: TouchRippleEffect(
                              backgroundColor: Colors.transparent,

                              // focusColor: Colors.amber,
                              // splashColor: Colors.blue,
                              // hoverColor: Colors.red,
                              // highlightColor: Colors.pink,

                              borderRadius: BorderRadius.circular(10),
                              rippleColor: MyColor.blue.withOpacity(0.8),
                              onTap: () {
                                showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                      // <-- SEE HERE
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20.0),
                                      ),
                                    ),
                                    context: context,
                                    builder: ((builder) =>
                                        bottomSheet1("Two")));
                              },
                              child: selectedImage2 != null
                                  ? Container(
                                      height: size.height * 0.19,
                                      width: size.width * 0.40,
                                      decoration: const BoxDecoration(
                                        color: MyColor.yellowF6F1E1,
                                      ),
                                      child: Image.file(
                                        selectedImage2!,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Container(
                                      height: size.height * 0.19,
                                      width: size.width * 0.40,
                                      decoration: const BoxDecoration(
                                        color: MyColor.yellowF6F1E1,
                                      ),
                                      child: Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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

  Future<void> chooseImage1(type, String check) async {
    imageFileList.clear();
    if (check == "One") {
      if (type == "camera") {
        image1 = await ImagePicker()
            .pickImage(source: ImageSource.camera, imageQuality: 50);
        imageFileList.add(image1);
      } else {
        image1 = await ImagePicker()
            .pickImage(source: ImageSource.gallery, imageQuality: 50);
        imageFileList.add(image1);
      }

      if (image1 != null) {
        setState(() {
          selectedImage1 = File(image1.path);
          base64Image = base64Encode(selectedImage1!.readAsBytesSync());
        });
      }
    } else {
      if (type == "camera") {
        image1 = await ImagePicker()
            .pickImage(source: ImageSource.camera, imageQuality: 50);
        imageFileList.add(image1);
      } else {
        image1 = await ImagePicker()
            .pickImage(source: ImageSource.gallery, imageQuality: 50);
        imageFileList.add(image1);
      }

      if (image1 != null) {
        setState(() {
          selectedImage2 = File(image1.path);
          base64Image = base64Encode(selectedImage2!.readAsBytesSync());
        });
      }
    }
  }

  Widget bottomSheet1(String check) {
    return Container(
      height: 110.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Product Images",
            style: TextStyle(
              fontSize: 20,
              color: MyColor.blue,
              fontFamily: Fonts.vietna,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 1.0, color: MyColor.blue),
                    minimumSize: const Size(110, 35),
                    maximumSize: const Size(115, 35),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    chooseImage1("camera", check);
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.camera,
                    color: MyColor.blue,
                  ),
                  label: const Text(
                    "camera",
                    style: TextStyle(
                      fontSize: 10,
                      color: MyColor.blue,
                      fontFamily: Fonts.vietna,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: MyColor.blue),
                  minimumSize: const Size(110, 35),
                  maximumSize: const Size(115, 35),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  chooseImage1("Gallery", check);
                  setState(() {});
                },
                icon: const Icon(
                  Icons.image,
                  color: MyColor.blue,
                ),
                label: const Text(
                  "Gallery",
                  style: TextStyle(
                    fontSize: 10,
                    color: MyColor.blue,
                    fontFamily: Fonts.vietna,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
