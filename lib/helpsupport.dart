import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class HelpSupportscr extends StatefulWidget {
  const HelpSupportscr({super.key});

  @override
  State<HelpSupportscr> createState() => _HelpSupportscrState();
}

class _HelpSupportscrState extends State<HelpSupportscr> {
  // <<<<<<<Controller >>>>>>

  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmnewPassController = TextEditingController();

  //// <<<<<<<<<<<   Focous node >>>>>>>>>

  File? selectedImage1;
  List<XFile> imageFileList = [];
  dynamic image1;

  String base64Image = "";
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
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
                Language().helpSupport,
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
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "How To Read",
                        style: TextStyle(
                          color: MyColor.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: Fonts.vietna,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                          style: TextStyle(
                            color: MyColor.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                            fontFamily: Fonts.vietna,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "How To Read",
                        style: TextStyle(
                          color: MyColor.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: Fonts.vietna,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                          style: TextStyle(
                            color: MyColor.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                            fontFamily: Fonts.vietna,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "How To Read",
                        style: TextStyle(
                          color: MyColor.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: Fonts.vietna,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                          style: TextStyle(
                            color: MyColor.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                            fontFamily: Fonts.vietna,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "How To Read",
                        style: TextStyle(
                          color: MyColor.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: Fonts.vietna,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                          style: TextStyle(
                            color: MyColor.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                            fontFamily: Fonts.vietna,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       margin: const EdgeInsets.only(bottom: 20),
            //       width: size.width * 0.95,
            //       height: 55,
            //       child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: MyColor.blue,
            //             // surfaceTintColor: MyColor.white,
            //             overlayColor: MyColor.liteyellow,
            //             enableFeedback: true,

            //             enabledMouseCursor: MouseCursor.defer,
            //             // Background color
            //             // Text color (alternative)
            //             elevation: 5, // Optional: elevation (shadow)
            //             padding: const EdgeInsets.symmetric(
            //                 horizontal: 20, vertical: 10), // Custom padding
            //             shape: RoundedRectangleBorder(
            //               borderRadius:
            //                   BorderRadius.circular(34), // Custom shape
            //             ),
            //           ),
            //           onPressed: () {
            //             // Navigator.push(
            //             //     context,
            //             //     MaterialPageRoute(
            //             //         builder: (context) => VerificationScr(
            //             //               email: widget.email,
            //             //             )));
            //             showDialog(
            //                 context: context,
            //                 builder: (_) => AlertDialog(
            //                     shape: const RoundedRectangleBorder(
            //                         borderRadius: BorderRadius.all(
            //                             Radius.circular(25.0))),
            //                     content: Builder(builder: (context) {
            //                       // Get available height and width of the build area of this widget. Make a choice depending on the size.
            //                       var size = MediaQuery.of(context).size;

            //                       return SizedBox(
            //                         height: size.height * 0.38,
            //                         width: size.width * 0.90,
            //                         child: Column(
            //                           children: [
            //                             Container(
            //                               child: Lottie.asset(
            //                                 'assets/images/PasswordChangeCooking.json',
            //                                 height: MediaQuery.of(context)
            //                                         .size
            //                                         .height *
            //                                     0.17,
            //                                 width: MediaQuery.of(context)
            //                                     .size
            //                                     .width,
            //                               ),
            //                             ),
            //                             Text(
            //                               Language().passwordchanged,
            //                               style: const TextStyle(
            //                                 color: MyColor.black,
            //                                 fontWeight: FontWeight.w500,
            //                                 fontSize: 20,
            //                                 fontFamily: Fonts.vietna,
            //                               ),
            //                             ),
            //                             SizedBox(
            //                               height: size.height * 0.01,
            //                             ),
            //                             Text(
            //                               Language()
            //                                   .yourpasswordhasbeensuccessfullyreset,
            //                               textAlign: TextAlign.center,
            //                               style: const TextStyle(
            //                                 color: MyColor.black,
            //                                 fontWeight: FontWeight.w300,
            //                                 fontSize: 15,
            //                                 fontFamily: Fonts.vietna,
            //                               ),
            //                             ),
            //                             SizedBox(
            //                               height: size.height * 0.03,
            //                             ),
            //                             SizedBox(
            //                               width: size.width * 0.95,
            //                               height: 55,
            //                               child: ElevatedButton(
            //                                   style: ElevatedButton.styleFrom(
            //                                     backgroundColor: MyColor.blue,
            //                                     // surfaceTintColor: MyColor.white,
            //                                     overlayColor:
            //                                         MyColor.liteyellow,
            //                                     enableFeedback: true,

            //                                     enabledMouseCursor:
            //                                         MouseCursor.defer,
            //                                     // Background color
            //                                     // Text color (alternative)
            //                                     elevation:
            //                                         5, // Optional: elevation (shadow)
            //                                     padding: const EdgeInsets
            //                                         .symmetric(
            //                                         horizontal: 20,
            //                                         vertical:
            //                                             10), // Custom padding
            //                                     shape: RoundedRectangleBorder(
            //                                       borderRadius:
            //                                           BorderRadius.circular(
            //                                               34), // Custom shape
            //                                     ),
            //                                   ),
            //                                   onPressed: () {
            //                                     Navigator.of(context)
            //                                         .pushAndRemoveUntil(
            //                                             MaterialPageRoute(
            //                                                 builder: (context) =>
            //                                                     const DashBoardScr(
            //                                                       pageIndex: 0,
            //                                                     )),
            //                                             (Route<dynamic>
            //                                                     route) =>
            //                                                 false);
            //                                     setState(() {});
            //                                   },
            //                                   child: Text(
            //                                     Language().gotoHome.toString(),
            //                                     style: const TextStyle(
            //                                       fontSize: 16,
            //                                       fontWeight: FontWeight.w500,
            //                                       fontFamily: Fonts.vietna,
            //                                       color: MyColor.white,
            //                                     ),
            //                                   )),
            //                             ),
            //                           ],
            //                         ),
            //                       );
            //                     })));
            //           },
            //           child: Text(
            //             Language().savePassword.toString(),
            //             style: const TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.w500,
            //               fontFamily: Fonts.vietna,
            //               color: MyColor.white,
            //             ),
            //           )),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
