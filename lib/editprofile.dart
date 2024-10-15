import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class EditProfilescr extends StatefulWidget {
  const EditProfilescr({super.key});

  @override
  State<EditProfilescr> createState() => _EditProfilescrState();
}

class _EditProfilescrState extends State<EditProfilescr> {
  // <<<<<<<Controller >>>>>>

  TextEditingController fullnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();

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
                Language().editProfile,
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
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      imageFileList.clear();
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            // <-- SEE HERE
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.0),
                            ),
                          ),
                          context: context,
                          builder: ((builder) => bottomSheet1()));
                    },
                    child: Stack(
                      children: [
                        selectedImage1 == null
                            ? SizedBox(
                                // height: size.height * 0.12,
                                // width: size.width * 0.40,
                                // color: Colors.amber,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 60,
                                  backgroundImage: Image.asset(
                                    // height: 20,
                                    // width: 20,
                                    ImageAsset.demoPerson,
                                    fit: BoxFit.contain,
                                  ).image,
                                ),
                              )
                            : SizedBox(
                                // height: size.height * 0.12,
                                // width: size.width * 0.40,
                                // color: Colors.amber,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 60,
                                  backgroundImage: Image.file(
                                    // height: size.height * 0.12,
                                    // width: 10,
                                    selectedImage1!,
                                    fit: BoxFit.contain,
                                  ).image,
                                ),
                              ),
                        Positioned(
                          left: 90,
                          top: 80,
                          child: Image.asset(
                            ImageAsset.cameraimage,
                            height: 30,
                            width: 30,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          Language().firstName.toString(),
                          style: const TextStyle(
                            color: MyColor.black,
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
                            color: _isFocusedcolor == "firstName"
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
                        controller: fullnameController,

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
                          hintText: Language().enterfirstName.toString(),
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
                          Language().lastName.toString(),
                          style: const TextStyle(
                            color: MyColor.black,
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
                            color: _isFocusedcolor == "lastName"
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
                          _isFocusedcolor = "lastName";
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
                        controller: lastnameController,

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
                          hintText: Language().enterlastName.toString(),
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
                    },
                    child: Text(
                      Language().update.toString(),
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

  Future<void> chooseImage1(type) async {
    imageFileList.clear();

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
  }

  Widget bottomSheet1() {
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
                    chooseImage1("camera");
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
                  chooseImage1("Gallery");
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
