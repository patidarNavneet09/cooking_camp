import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/views/dashboard.dart';
import 'package:cooking_champs/views/authentication/kids_registerd_view.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class MyKidsProfileShowView extends StatefulWidget {
  const MyKidsProfileShowView({super.key});

  @override
  State<MyKidsProfileShowView> createState() => _MyKidsProfileShowViewState();
}

class _MyKidsProfileShowViewState extends State<MyKidsProfileShowView> {
  // <<<<<<<Controller >>>>>>

  //// <<<<<<<<<<<   Focous node >>>>>>>>>

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
                    // Navigator.pop(context);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const DashBoardView(
                                pageIndex: 0,
                              )),
                    );
                    isTabExplore = false;
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                Text(
                  Languages.of(context)!.myKids,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: Fonts.beVietnamProRegular,
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
                          // color: MyColor.blue,
                          height: size.height * 0.80, // 80% of screen height
                          child: SizedBox(
                            height: size.height *
                                0.85, // also sets 80% height for the ListView
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
                                          child: Image.asset(AssetsPath.image),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
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
                                                  fontFamily: Fonts.beVietnamProRegular,
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
                                                  fontFamily: Fonts.beVietnamProRegular,
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
                                                    fontFamily: Fonts.beVietnamProRegular,
                                                    color: MyColor.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                InkWell(
                                                  radius: 30,
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const KidsRegisterScreen(
                                                                check: true,
                                                                editCheck: true,
                                                              )),
                                                    );
                                                  },
                                                  child: Image.asset(
                                                    AssetsPath.editfullback,
                                                    width: 30,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Image.asset(
                                                  AssetsPath.deletefullback,
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
                                backgroundColor: MyColor.appTheme,
                                // surfaceTintColor: MyColor.white,
                                overlayColor: MyColor.liteOrange,
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
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const KidsRegisterScreen(
                                            check: true,
                                          )),
                                );
                              },
                              child: Text(
                                Languages.of(context)!.addkidsmore.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Fonts.beVietnamProRegular,
                                  color: MyColor.white,
                                ),
                              )),
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
}