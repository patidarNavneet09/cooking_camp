import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:flutter/material.dart';

class Registredscr extends StatefulWidget {
  const Registredscr({super.key});

  @override
  State<Registredscr> createState() => _RegistredscrState();
}

class _RegistredscrState extends State<Registredscr> {
  // <<<<<<<Controller >>>>>>

  TextEditingController fullnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController parantemailController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatpasswordController = TextEditingController();

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
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Image.asset(
              ImageAsset.loginbackground,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.06,
                ),
                Image.asset(
                  width: 110,
                  height: 60,
                  ImageAsset.antapanta,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  Language().jointheCookingChamps,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: Fonts.vietna,
                    color: MyColor.black,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                Text(
                  Language().signupforafunand,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: Fonts.vietna,
                    color: MyColor.black,
                  ),
                ),
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
                                    radius: 50,
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
                                    radius: 50,
                                    backgroundImage: Image.file(
                                      // height: size.height * 0.12,
                                      // width: 10,
                                      selectedImage1!,
                                      fit: BoxFit.contain,
                                    ).image,
                                  ),
                                ),
                          Positioned(
                            left: 70,
                            top: 60,
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
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Text(
                            Language().parentEmail.toString(),
                            style: const TextStyle(
                              color: MyColor.black,
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
                              color: _isFocusedcolor == "parentEmail"
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
                            _isFocusedcolor = "parentEmail";
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
                          controller: parantemailController,

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
                        height: size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Text(
                            Language().emailstar.toString(),
                            style: const TextStyle(
                              color: MyColor.black,
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
                              color: _isFocusedcolor == "emailstar"
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
                            _isFocusedcolor = "emailstar";
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
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Language().passwordstar.toString(),
                            style: const TextStyle(
                              color: MyColor.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              fontFamily: Fonts.vietna,
                            ),
                          ),
                          Text(
                            Language().atleast5.toString(),
                            style: const TextStyle(
                              color: MyColor.red,
                              fontWeight: FontWeight.w300,
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
                              color: _isFocusedcolor == "passwordstar"
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
                            _isFocusedcolor = "passwordstar";
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Language().repeatpassword.toString(),
                            style: const TextStyle(
                              color: MyColor.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              fontFamily: Fonts.vietna,
                            ),
                          ),
                          Text(
                            Language().atleast5.toString(),
                            style: const TextStyle(
                              color: MyColor.red,
                              fontWeight: FontWeight.w300,
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
                              color: _isFocusedcolor == "repeatpassword"
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
                            _isFocusedcolor = "repeatpassword";
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
                          controller: repeatpasswordController,

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
                        height: size.height * 0.04,
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
                                  horizontal: 20,
                                  vertical: 10), // Custom padding
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(34), // Custom shape
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              Language().register.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: Fonts.vietna,
                                color: MyColor.white,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                    ],
                  ),
                )
              ],
            ),
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
