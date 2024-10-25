import 'dart:convert';
import 'dart:io';
import 'package:cooking_champs/dashboard.dart';
import 'package:cooking_champs/kidsprofileshow.dart';
import 'package:cooking_champs/login.dart';
import 'package:cooking_champs/mykits.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class KitsRegistredscr extends StatefulWidget {
  final bool? check;
  final bool? editcheck;
  const KitsRegistredscr({super.key, this.check, this.editcheck});

  @override
  State<KitsRegistredscr> createState() => _KitsRegistredscrState();
}

class _KitsRegistredscrState extends State<KitsRegistredscr> {
  // <<<<<<<Controller >>>>>>

  TextEditingController enternameController = TextEditingController();
  TextEditingController selectyourcampbornday = TextEditingController();
  TextEditingController selectyourcampmanth = TextEditingController();
  TextEditingController selectyourcampyear = TextEditingController();
  TextEditingController enterclassgrade = TextEditingController();
  TextEditingController enterusername = TextEditingController();
  TextEditingController enterpassword = TextEditingController();

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
      appBar: widget.check == true
          ? AppBar(
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
                        istabExplore = false;
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      widget.editcheck == true
                          ? Language().editKidProfile
                          : Language().addAnotherKid,
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
            )
          : null,
      body: Stack(
        children: [
          // SizedBox(
          //   width: size.width,
          //   height: size.height,
          //   child: Image.asset(
          //     ImageAsset.loginbackground,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.check == true
                    ? Container()
                    : SizedBox(
                        height: size.height * 0.06,
                      ),
                widget.check == true
                    ? Container()
                    : Image.asset(
                        width: 110,
                        height: 60,
                        ImageAsset.antapanta,
                        fit: BoxFit.contain,
                      ),
                widget.check == true
                    ? Container()
                    : SizedBox(
                        height: size.height * 0.01,
                      ),
                widget.check == true
                    ? Container()
                    : Text(
                        Language().letCreateYourKidChampProfile,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
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
                            child: CircleAvatar(
                              backgroundColor: MyColor.blue,
                              radius: 15,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.asset(
                                  ImageAsset.addimage,
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.contain,
                                  color: MyColor.white,
                                ),
                              ),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Language().yourChampFullName.toString(),
                        style: const TextStyle(
                          color: MyColor.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontFamily: Fonts.vietna,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Text(
                            Language().name.toString(),
                            style: const TextStyle(
                              color: MyColor.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              fontFamily: Fonts.vietna,
                            ),
                          ),
                          // const Text(
                          //   " *",
                          //   style: TextStyle(
                          //     color: MyColor.red,
                          //     fontWeight: FontWeight.w600,
                          //     fontSize: 14,
                          //     fontFamily: Fonts.vietna,
                          //   ),
                          // ),
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
                          controller: enternameController,

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
                            hintText: Language().entername.toString(),
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
                      Text(
                        Language().dateofbirth.toString(),
                        style: const TextStyle(
                          color: MyColor.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontFamily: Fonts.vietna,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                Language().day.toString(),
                                style: const TextStyle(
                                  color: MyColor.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  fontFamily: Fonts.vietna,
                                ),
                              ),
                              // const Text(
                              //   " *",
                              //   style: TextStyle(
                              //     color: MyColor.red,
                              //     fontWeight: FontWeight.w600,
                              //     fontSize: 14,
                              //     fontFamily: Fonts.vietna,
                              //   ),
                              // ),
                            ],
                          ),
                          Text(
                            Language().optional.toString(),
                            style: const TextStyle(
                              color: MyColor.blue,
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
                          readOnly: true,
                          textCapitalization: TextCapitalization.sentences,
                          onTap: () async {
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2025),
                            );

                            if (selectedDate != null) {
                              // Format the selected date to the desired string format
                              String formattedDate =
                                  "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')} 00:00:00.000";
                              debugPrint(
                                  "selectedDate>>>>>>>> ${selectedDate.day.toString().padLeft(2, '0')}");
                              selectyourcampbornday.text =
                                  selectedDate.day.toString().padLeft(2, '0');
                              setState(() {});
                            } else {
                              debugPrint("No date selected");
                            }
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
                          controller: selectyourcampbornday,

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
                            hintText:
                                Language().selectyourcampbornday.toString(),
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
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                size: 25,
                              ),
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
                          Row(
                            children: [
                              Text(
                                Language().month.toString(),
                                style: const TextStyle(
                                  color: MyColor.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  fontFamily: Fonts.vietna,
                                ),
                              ),
                              // const Text(
                              //   " *",
                              //   style: TextStyle(
                              //     color: MyColor.red,
                              //     fontWeight: FontWeight.w600,
                              //     fontSize: 14,
                              //     fontFamily: Fonts.vietna,
                              //   ),
                              // ),
                            ],
                          ),
                          Text(
                            Language().optional.toString(),
                            style: const TextStyle(
                              color: MyColor.blue,
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
                          readOnly: true,
                          textCapitalization: TextCapitalization.sentences,
                          onTap: () async {
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2025),
                            );

                            if (selectedDate != null) {
                              // Format the selected date to the desired string format
                              String formattedDate =
                                  "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')} 00:00:00.000";
                              debugPrint(
                                  "selectedDate>>>>>>>> ${selectedDate.month.toString().padLeft(2, '0')}");
                              selectyourcampmanth.text =
                                  selectedDate.month.toString().padLeft(2, '0');
                              setState(() {});
                            } else {
                              debugPrint("No date selected");
                            }
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
                          controller: selectyourcampmanth,

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
                            hintText: Language().selectyourcampmanth.toString(),
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
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                size: 25,
                              ),
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
                            Language().year.toString(),
                            style: const TextStyle(
                              color: MyColor.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
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
                          readOnly: true,
                          textCapitalization: TextCapitalization.sentences,
                          onTap: () async {
                            DateTime? selectedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2025),
                                initialDatePickerMode: DatePickerMode.year);

                            if (selectedDate != null) {
                              // Format the selected date to the desired string format
                              String formattedDate =
                                  "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')} 00:00:00.000";
                              debugPrint(
                                  "selectedDate>>>>>>>> ${selectedDate.month.toString().padLeft(2, '0')}");
                              selectyourcampyear.text =
                                  selectedDate.year.toString();
                              setState(() {});
                            } else {
                              debugPrint("No date selected");
                            }
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
                          controller: selectyourcampyear,

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
                            hintText: Language().selectyourcampyear.toString(),
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
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                size: 25,
                              ),
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
                      Text(
                        Language().whichclassgradearetheyin.toString(),
                        style: const TextStyle(
                          color: MyColor.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontFamily: Fonts.vietna,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                Language().classgrade.toString(),
                                style: const TextStyle(
                                  color: MyColor.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  fontFamily: Fonts.vietna,
                                ),
                              ),
                              // const Text(
                              //   " *",
                              //   style: TextStyle(
                              //     color: MyColor.red,
                              //     fontWeight: FontWeight.w600,
                              //     fontSize: 14,
                              //     fontFamily: Fonts.vietna,
                              //   ),
                              // ),
                            ],
                          ),
                          // Text(
                          //   Language().atleast5.toString(),
                          //   style: const TextStyle(
                          //     color: MyColor.red,
                          //     fontWeight: FontWeight.w300,
                          //     fontSize: 14,
                          //     fontFamily: Fonts.vietna,
                          //   ),
                          // ),
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
                          controller: enterclassgrade,

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
                            hintText: Language().enterclassgrade.toString(),
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
                          Row(
                            children: [
                              Text(
                                Language().username.toString(),
                                style: const TextStyle(
                                  color: MyColor.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  fontFamily: Fonts.vietna,
                                ),
                              ),
                              // const Text(
                              //   " *",
                              //   style: TextStyle(
                              //     color: MyColor.red,
                              //     fontWeight: FontWeight.w600,
                              //     fontSize: 14,
                              //     fontFamily: Fonts.vietna,
                              //   ),
                              // ),
                            ],
                          ),
                          // Text(
                          //   Language().atleast5.toString(),
                          //   style: const TextStyle(
                          //     color: MyColor.red,
                          //     fontWeight: FontWeight.w300,
                          //     fontSize: 14,
                          //     fontFamily: Fonts.vietna,
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: _isFocusedcolor == "enterusername"
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
                            _isFocusedcolor = "enterusername";
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
                          controller: enterusername,

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
                            hintText: Language().enterusername.toString(),
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
                          Row(
                            children: [
                              Text(
                                Language().password.toString(),
                                style: const TextStyle(
                                  color: MyColor.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  fontFamily: Fonts.vietna,
                                ),
                              ),
                              // const Text(
                              //   " *",
                              //   style: TextStyle(
                              //     color: MyColor.red,
                              //     fontWeight: FontWeight.w600,
                              //     fontSize: 14,
                              //     fontFamily: Fonts.vietna,
                              //   ),
                              // ),
                            ],
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
                          controller: enterpassword,

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
                        height: size.height * 0.05,
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
                            onPressed: () {
                              // Navigator.of(context).pushAndRemoveUntil(
                              //     MaterialPageRoute(
                              //         builder: (context) => const DashBoardScr(
                              //               pageIndex: 0,
                              //             )),
                              //     (Route<dynamic> route) => false);

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
                                                  'assets/images/CookingChamp.json',
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
                                                Language().childprofilecreated,
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
                                                "Great! You’ve successfully created   ${enternameController.text} profile. Would you like to add another child?",
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
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          MyColor.blue,
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
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                34), // Custom shape
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      if (widget.check ==
                                                          true) {
                                                        Navigator.of(context)
                                                            .pushReplacement(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            MyKitsProfileShowscr()));

                                                        // Navigator.of(context)
                                                        //     .pushAndRemoveUntil(
                                                        //         MaterialPageRoute(
                                                        //             builder:
                                                        //                 (context) =>
                                                        //                     const MyKitsProfileShowscr()),
                                                        //         (Route<dynamic>
                                                        //                 route) =>
                                                        //             false);
                                                      } else {
                                                        Navigator.of(context)
                                                            .pushAndRemoveUntil(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const KitsProfileShowscr()),
                                                                (Route<dynamic>
                                                                        route) =>
                                                                    false);
                                                      }
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      Language()
                                                          .okay
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            Fonts.vietna,
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
                              Language().careatekidprifile.toString(),
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
