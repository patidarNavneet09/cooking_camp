import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class CookDetailsScr extends StatefulWidget {
  final String? name;
  const CookDetailsScr({super.key, this.name});

  @override
  State<CookDetailsScr> createState() => _CookDetailsScrState();
}

class _CookDetailsScrState extends State<CookDetailsScr> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColor.white,
      resizeToAvoidBottomInset: true,
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
        backgroundColor: MyColor.liteyellow,
        surfaceTintColor: MyColor.liteyellow,
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
                widget.name.toString(),
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
      body: SingleChildScrollView(
          // padding: EdgeInsets.zero,

          child: Wrap(
        children: [
          Container(
            color: MyColor.liteyellow,
          ),
          Stack(
            children: [
              Container(
                width: size.width,
                height: 280,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: MyColor.liteyellow,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                            height: 180,
                            width: size.width * 0.60,
                            "assets/images/delicious-salad-studio 1.png"),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: 325,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  // color: MyColor.red,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: size.width * 0.20,
                          height: 92,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: MyColor.white,
                            boxShadow: [
                              BoxShadow(
                                color: MyColor.colorE2E2E2.withOpacity(0.8),
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.asset(height: 58, ImageAsset.image174),
                          ),
                        ),
                        Container(
                          width: size.width * 0.20,
                          height: 92,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: MyColor.white,
                            boxShadow: [
                              BoxShadow(
                                color: MyColor.colorE2E2E2.withOpacity(0.8),
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.asset(height: 58, ImageAsset.image175),
                          ),
                        ),
                        Container(
                          width: size.width * 0.20,
                          height: 92,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: MyColor.white,
                            boxShadow: [
                              BoxShadow(
                                color: MyColor.colorE2E2E2.withOpacity(0.8),
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.asset(height: 58, ImageAsset.image176),
                          ),
                        ),
                        Container(
                          width: size.width * 0.20,
                          height: 92,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: MyColor.white,
                            boxShadow: [
                              BoxShadow(
                                color: MyColor.colorE2E2E2.withOpacity(0.8),
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.asset(height: 58, ImageAsset.image177),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 15, right: 15, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      Language().ingredient,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: Fonts.vietna,
                        color: MyColor.black,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  padding: const EdgeInsets.only(top: 08),
                  itemCount: 3,
                  shrinkWrap: true, // Add this to fix the height issue
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable ListView scrolling
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(height: 19, width: 20, ImageAsset.dots),
                          const Expanded(
                            child: Text(
                              "1/2 cup Rainbow Peppers Step 1- Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: Fonts.vietna,
                                color: MyColor.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const Divider(
            color: MyColor.colorDADADA,
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 15, right: 15, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      Language().howtoCook,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: Fonts.vietna,
                        color: MyColor.black,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  padding: const EdgeInsets.only(top: 08),
                  itemCount: 3,
                  shrinkWrap: true, // Add this to fix the height issue
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable ListView scrolling
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image.asset(height: 19, width: 20, ImageAsset.dots),
                          Expanded(
                            child: Text(
                              "Step 1- Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: Fonts.vietna,
                                color: MyColor.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Container(
          //   height: 150,
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(46), topRight: Radius.circular(46)),
          //     color: MyColor.colorF3E6FF,
          //     // boxShadow: [
          //     //   BoxShadow(
          //     //     color: MyColor.colorF3E6FF,
          //     //     spreadRadius: 3,
          //     //     blurRadius: 2,
          //     //     offset: const Offset(0, 1),
          //     //   ),
          //     // ],
          //   ),
          //   child: Column(
          //     children: [
          //       Row(
          //         children: [
          //           Text("data"),
          //         ],
          //       ),
          //     ],
          //   ),
          // )
          Container(
            padding: EdgeInsets.all(10),
            height: 180,
            decoration: BoxDecoration(
              color: MyColor.colorF8F0FF,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(46), topRight: Radius.circular(46)),
            ),
            alignment:
                Alignment.center, // Centers text vertically and horizontally
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Image.asset(ImageAsset.image),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            Row(
                              children: [
                                const Text(
                                  "12 | March | 2006 | 1 st Standard",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: Fonts.vietna,
                                    color: MyColor.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      //     Row(
                      //       children: [
                      //         Image.asset(
                      //           ImageAsset.editfullback,
                      //           width: 30,
                      //         ),
                      //         SizedBox(
                      //           width: 5,
                      //         ),
                      //         Image.asset(
                      //           ImageAsset.deletefullback,
                      //           width: 30,
                      //         )
                      //       ],
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
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
                        // Navigator.of(context)
                        //     .pushAndRemoveUntil(
                        //         MaterialPageRoute(
                        //             builder:
                        //                 (context) =>
                        //                     const KitsProfileShowscr()),
                        //         (Route<dynamic>
                        //                 route) =>
                        //             false);
                        // setState(() {});
                      },
                      child: Text(
                        Language().sendRequest.toString(),
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
        ],
      )),
    );
  }
}
