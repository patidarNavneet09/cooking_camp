import 'dart:convert';
import 'dart:io';
import 'package:cooking_champs/dashboard.dart';
import 'package:cooking_champs/kitsprofileresitred.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class KitsProfileShowscr extends StatefulWidget {
  const KitsProfileShowscr({super.key});

  @override
  State<KitsProfileShowscr> createState() => _KitsProfileShowscrState();
}

class _KitsProfileShowscrState extends State<KitsProfileShowscr> {
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
        body: SingleChildScrollView(
      child: Stack(
        children: [
          // SizedBox(
          //   width: size.width,
          //   height: size.height,
          //   child: Image.asset(
          //     ImageAsset.loginbackground,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.80,
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
                      Language().letCreateYourKidChampProfile,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: Fonts.vietna,
                        color: MyColor.black,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    SizedBox(
                      // color: MyColor.blue,
                      height: size.height * 0.565, // 80% of screen height
                      child: SizedBox(
                        height: size.height *
                            0.80, // also sets 80% height for the ListView
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics:
                              const ClampingScrollPhysics(), // Prevents bouncing on scroll
                          itemCount: 13,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 8, bottom: 8),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                height: 90,
                                decoration: BoxDecoration(
                                  color: MyColor.colorF8F0FF,
                                  borderRadius: BorderRadius.circular(
                                      12), // Optional rounded corners
                                ),
                                alignment: Alignment
                                    .center, // Centers text vertically and horizontally
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
                                      child: Image.asset(ImageAsset.image),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Andrew Robert",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: Fonts.vietna,
                                              color: MyColor.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          const Text(
                                            "12 | March | 2006",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: Fonts.vietna,
                                              color: MyColor.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          SizedBox(
                                            width: size.width * 0.51,
                                            height: 20,
                                            child: const Text(
                                              "1 st Standard",
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: Fonts.vietna,
                                                color: MyColor.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              ImageAsset.editfullback,
                                              width: 30,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Image.asset(
                                              ImageAsset.deletefullback,
                                              width: 30,
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Center(
                    child: SizedBox(
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
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const KitsRegistredscr()),
                                (Route<dynamic> route) => false);
                          },
                          child: Text(
                            Language().addkidsmore.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: Fonts.vietna,
                              color: MyColor.white,
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Center(
                    child: SizedBox(
                      width: size.width * 0.95,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColor.white,
                          // overlayColor:
                          //     WidgetStateProperty.all(Colors.),
                          elevation: 5,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(34),
                            side: BorderSide(
                                color: MyColor.blue, width: 1), // Blue border
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const DashBoardScr(
                                        pageIndex: 0,
                                      )),
                              (Route<dynamic> route) => false);
                          setState(() {});
                          // Your navigation logic here
                        },
                        child: Center(
                          // Centering the text
                          child: Text(
                            Language().gotoHome.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: Fonts.vietna,
                              color: MyColor.blue, // Setting text color to blue
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ));
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
