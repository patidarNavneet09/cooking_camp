import 'package:cooking_champs/aboutus.dart';
import 'package:cooking_champs/friendrequest.dart';
import 'package:cooking_champs/helpsupport.dart';
import 'package:cooking_champs/changepassword.dart';
import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/editprofile.dart';
import 'package:cooking_champs/home.dart';
import 'package:cooking_champs/kitslearning.dart';
import 'package:cooking_champs/login.dart';
import 'package:cooking_champs/mykits.dart';
import 'package:cooking_champs/ourstories.dart';
import 'package:cooking_champs/recipe.dart';
import 'package:cooking_champs/save.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DashBoardScr extends StatefulWidget {
  final int? pageIndex;
  final String? tabcheck;
  const DashBoardScr({super.key, this.pageIndex, this.tabcheck});

  @override
  State<DashBoardScr> createState() => _DashBoardScrState();
}

bool? istabExplore = false;
int pageIndex = 0;

class _DashBoardScrState extends State<DashBoardScr> {
  bool? isLogin = false;

  // pages count & variable assign >>>>>>>>>

  var pages = [
    const HomeScr(),
    const RecipeScr(),
    const SaveScr(),
  ];
  var pages1 = [
    const HomeScr(),
    const RecipeScr(),
    const SaveScr(),
  ];
  @override
  void initState() {
    super.initState();
    {
      // if (istabExplore == false) {
      pageIndex = widget.pageIndex!;
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        debugPrint("dfsdfsdf");
        // if (istabExplore == true) {
        //   // istabExplore = false;
        //   // setState(() {});
        //   Navigator.of(context).pushAndRemoveUntil(
        //       MaterialPageRoute(
        //           builder: (context) => const DashBoardScr(
        //                 pageIndex: 0,
        //                 tabcheck: "",
        //               )),
        //       (Route<dynamic> route) => true);
        //   setState(() {});
        // }
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        bottomNavigationBar: buildMyNavBar(context),
        body: istabExplore == true
            ? widget.tabcheck == "kids"
                ? const KitsLearningScr()
                : widget.tabcheck == "OurStories"
                    ? const OurStoriesScr()
                    : widget.tabcheck == "Aboutus"
                        ? const AboutUsScr()
                        : Container()
            : pageIndex == 3
                ? pages[2]
                : pages[pageIndex],
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: MyColor.liteyellowbottom,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    InkWell(
                      radius: 50,
                      customBorder: const CircleBorder(),
                      onTap: () {
                        // print(DateTime.now().timeZoneOffset.toString());
                        pageIndex = 0;
                        istabExplore = false;
                        // print(pageIndex);
                        setState(() {});
                      },
                      child: SizedBox(
                        // color: Colors.amber,
                        height: 60,
                        width: 60,
                        child: Column(
                          children: [
                            // pageIndex == 0
                            //     ? const Icon(
                            //         Icons.pentagon_rounded,
                            //         color: MyColor.pink,
                            //       )
                            //     : const Icon(Icons.pentagon_outlined),
                            SizedBox(
                                height: pageIndex == 0 ? 30 : 30,
                                width: 25,
                                child: Image.asset(
                                  // pageIndex == 0
                                  //     ?
                                  ImageAsset.homepng,
                                  color: pageIndex == 0
                                      ? null
                                      : MyColor.bottomiconcolor,
                                  // : "assets/images/ic_home2_icon.svg",
                                  // colorFilter: pageIndex == 0
                                  //     ? const ColorFilter.mode(
                                  //         MyColor.pink, BlendMode.srcIn)
                                  //     : const ColorFilter.mode(
                                  //         Colors.black, BlendMode.srcIn),
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              // pageIndex == 0 ? "Explore" : "",
                              pageIndex == 0 ? "Home" : "Home",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: Fonts.vietna,
                                  color: pageIndex == 0
                                      ? MyColor.blue
                                      : MyColor.bottomiconcolor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      radius: 50,
                      customBorder: const CircleBorder(),
                      onTap: () {
                        // List<String> data = [
                        //   "/data/user/0/com.example.property_app/cache/file_picker/1000002094.mp4",
                        //   "/data/user/0/com.example.property_app/cache/file_picker/1000002094.mp4",
                        //   "/data/user/0/com.example.property_app/cache/file_picker/1000002094.mp4"
                        // ];
                        // uploadFiles(data);
                        // if (isLogin != null) {
                        pageIndex = 1;
                        istabExplore = false;
                        // } else {
                        //   // showdialog();
                        //   // LoginMessages();
                        // }
                        // print(pageIndex);
                        setState(() {});
                      },
                      child: SizedBox(
                        // color: Colors.amber,
                        height: 60,
                        width: 60,
                        child: Column(
                          children: [
                            // pageIndex == 1
                            //     ? Icon(Icons.favorite_sharp,
                            //         color: pageIndex == 1
                            //             ? MyColor.pink
                            //             : Colors.black)
                            //     : const Icon(
                            //         Icons.favorite_outline_sharp,
                            //       ),
                            SizedBox(
                                height: pageIndex == 0 ? 30 : 30,
                                width: 25,
                                child: Image.asset(
                                  // pageIndex == 0
                                  //     ?
                                  ImageAsset.recipepng,
                                  color: pageIndex != 1
                                      ? MyColor.bottomiconcolor
                                      : null,
                                  // : "assets/images/ic_home2_icon.svg",
                                  // colorFilter: pageIndex == 0
                                  //     ? const ColorFilter.mode(
                                  //         MyColor.pink, BlendMode.srcIn)
                                  //     : const ColorFilter.mode(
                                  //         Colors.black, BlendMode.srcIn),
                                )),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              pageIndex == 1 ? "Recipe" : "Recipe",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: Fonts.vietna,
                                  color: pageIndex == 1
                                      ? MyColor.blue
                                      : MyColor.bottomiconcolor),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      radius: 50,
                      customBorder: const CircleBorder(),
                      onTap: () {
                        // if (isLogin != null) {
                        pageIndex = 2;
                        istabExplore = false;
                        // } else {
                        // showdialog();
                        // }
                        setState(() {});
                      },
                      child: SizedBox(
                        // color: Colors.amber,
                        height: 60,
                        width: 60,
                        child: Column(
                          children: [
                            SizedBox(
                                height: pageIndex == 0 ? 30 : 30,
                                width: 25,
                                child: Image.asset(
                                  // pageIndex == 0
                                  //     ?
                                  ImageAsset.savepng,
                                  color: pageIndex != 2
                                      ? MyColor.bottomiconcolor
                                      : null,
                                  // : "assets/images/ic_home2_icon.svg",
                                  // colorFilter: pageIndex == 0
                                  //     ? const ColorFilter.mode(
                                  //         MyColor.pink, BlendMode.srcIn)
                                  //     : const ColorFilter.mode(
                                  //         Colors.black, BlendMode.srcIn),
                                )),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              pageIndex == 2 ? "Save" : "Save",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: Fonts.vietna,
                                  color: pageIndex == 2
                                      ? MyColor.blue
                                      : MyColor.bottomiconcolor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    // Container(
                    //   height: 20,
                    //   width: 30,
                    //   child: Image.asset("assets/images/refer&earn.png",
                    //       color: pageIndex == 4 ? MyColor.pink : Colors.black),
                    // ),
                    InkWell(
                      radius: 50,
                      customBorder: const CircleBorder(),
                      onTap: () {
                        // if (isLogin != null) {
                        // pageIndex = 3;
                        // } else {
                        // showdialog();
                        // }
                        // print(pageIndex);

                        // istabExplore = true;
                        setState(() {});
                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.0),
                            ),
                          ),
                          isScrollControlled:
                              true, // <-- Add this to make it full screen
                          context: context,
                          builder: (BuildContext context) {
                            return DraggableScrollableSheet(
                              expand: false,
                              initialChildSize:
                                  0.65, // Makes the sheet take up the full height initially
                              minChildSize:
                                  0.5, // Optional: Minimum size when dragging down
                              maxChildSize: 1.0, // Full height
                              builder: (BuildContext context,
                                  ScrollController scrollController) {
                                return bottomSheet1(); // Your bottom sheet content here
                              },
                            );
                          },
                        );
                      },
                      child: SizedBox(
                        // color: Colors.amber,
                        height: 60,
                        width: 60,
                        child: Column(
                          children: [
                            SizedBox(
                                height: pageIndex == 0 ? 30 : 30,
                                width: 25,
                                child: Image.asset(
                                  // pageIndex == 0
                                  //     ?
                                  ImageAsset.menu,
                                  color: pageIndex != 3
                                      ? MyColor.bottomiconcolor
                                      : null,
                                  // : "assets/images/ic_home2_icon.svg",
                                  // colorFilter: pageIndex == 0
                                  //     ? const ColorFilter.mode(
                                  //         MyColor.pink, BlendMode.srcIn)
                                  //     : const ColorFilter.mode(
                                  //         Colors.black, BlendMode.srcIn),
                                )),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              pageIndex == 3 ? "Menu" : "Menu",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: Fonts.vietna,
                                  color: pageIndex == 3
                                      ? MyColor.blue
                                      : MyColor.bottomiconcolor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet1() {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.70,
      width: MediaQuery.of(context).size.width,
      // margin: const EdgeInsets.symmetric(
      //   horizontal: 20,
      //   vertical: 20,
      // ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 06,
                  decoration: const BoxDecoration(
                      color: MyColor.litegrayB5B5B5,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                        top: 20, bottom: 15, left: 20, right: 20),
                    width: size.width,
                    height: 90,
                    decoration: const BoxDecoration(
                        color: MyColor.yellowF6F1E1,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: CircleAvatar(
                                  radius: 35,
                                  child: Image.asset(ImageAsset.image),
                                ),
                              ),
                              const Expanded(
                                child: Text(
                                  "Ronald Robert",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: Fonts.vietna,
                                    color: MyColor.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.25,
                                height: 37,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: MyColor.blue,
                                        // surfaceTintColor: MyColor.white,
                                        overlayColor: MyColor.liteyellow,
                                        enableFeedback: true,
                                        enabledMouseCursor: MouseCursor.defer,
                                        // Background color
                                        // Text color (alternative)
                                        elevation:
                                            5, // Optional: elevation (shadow)
                                        // Custom padding
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10), // Custom shape
                                        ),
                                        padding: EdgeInsets.zero),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 20,
                                                      right: 20,
                                                      bottom: 15,
                                                      top: 15),
                                              insetPadding:
                                                  const EdgeInsets.only(
                                                      left: 20,
                                                      right: 20,
                                                      bottom: 15,
                                                      top: 15),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  25.0))),
                                              content:
                                                  Builder(builder: (context) {
                                                // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                                var size =
                                                    MediaQuery.of(context).size;

                                                return SizedBox(
                                                  height: size.height * 0.38,
                                                  width: size.width * 0.98,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        child: Lottie.asset(
                                                          'assets/images/Logout Cooki.json',
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.17,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                        ),
                                                      ),
                                                      Text(
                                                        Language()
                                                            .logoutAccount,
                                                        style: const TextStyle(
                                                          color: MyColor.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 20,
                                                          fontFamily:
                                                              Fonts.vietna,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.01,
                                                      ),
                                                      Text(
                                                        Language()
                                                            .areyousureyouwanttologoutyouraccount,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                          color: MyColor.black,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 15,
                                                          fontFamily:
                                                              Fonts.vietna,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.03,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          SizedBox(
                                                            width: size.width *
                                                                0.35,
                                                            height: 55,
                                                            child:
                                                                ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    MyColor
                                                                        .white,
                                                                overlayColor:
                                                                    MyColor
                                                                        .liteyellow,
                                                                enableFeedback:
                                                                    true,
                                                                enabledMouseCursor:
                                                                    MouseCursor
                                                                        .defer,
                                                                elevation:
                                                                    5, // Optional: elevation (shadow)
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical:
                                                                        10), // Custom padding
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              34), // Custom shape
                                                                  side: const BorderSide(
                                                                      color: MyColor
                                                                          .blue,
                                                                      width:
                                                                          2), // Blue border
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                Navigator.of(context).pushAndRemoveUntil(
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                const Loginscr()),
                                                                    (Route<dynamic>
                                                                            route) =>
                                                                        false);
                                                                setState(() {});
                                                              },
                                                              child: Text(
                                                                Language()
                                                                    .yes
                                                                    .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      Fonts
                                                                          .vietna,
                                                                  color: MyColor
                                                                      .blue, // Center text color blue
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.35,
                                                            height: 55,
                                                            child:
                                                                ElevatedButton(
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor:
                                                                          MyColor
                                                                              .blue,
                                                                      // surfaceTintColor: MyColor.white,
                                                                      overlayColor:
                                                                          MyColor
                                                                              .liteyellow,
                                                                      enableFeedback:
                                                                          true,

                                                                      enabledMouseCursor:
                                                                          MouseCursor
                                                                              .defer,
                                                                      // Background color
                                                                      // Text color (alternative)
                                                                      elevation:
                                                                          5, // Optional: elevation (shadow)
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                              20,
                                                                          vertical:
                                                                              10), // Custom padding
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(34), // Custom shape
                                                                      ),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                      // Navigator.of(context).pushAndRemoveUntil(
                                                                      //     MaterialPageRoute(
                                                                      //         builder: (context) => const DashBoardScr(
                                                                      //               pageIndex: 0,
                                                                      //             )),
                                                                      //     (Route<dynamic> route) => false);
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: Text(
                                                                      Language()
                                                                          .no
                                                                          .toString(),
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontFamily:
                                                                            Fonts.vietna,
                                                                        color: MyColor
                                                                            .white,
                                                                      ),
                                                                    )),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              })));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, right: 10),
                                          child: Image.asset(
                                              height: 20,
                                              width: 20,
                                              ImageAsset.logout),
                                        ),
                                        Text(
                                          Language().logout.toString(),
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: Fonts.vietna,
                                            color: MyColor.white,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Language().explore.toString(),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            fontFamily: Fonts.vietna,
                            color: MyColor.black,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: size.width * 0.80,
                          splashColor: MyColor.blue.withOpacity(0.2),
                          onTap: () {
                            istabExplore = true;
                            setState(() {});
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const DashBoardScr(
                                          pageIndex: 4,
                                          tabcheck: "kids",
                                        )),
                                (Route<dynamic> route) => false);
                          },
                          minTileHeight: 40,
                          leading: SizedBox(
                            width: size.width *
                                0.80, // Adjust this value as per your layout needs
                            child: Row(
                              children: [
                                Image.asset(
                                    height: 23, width: 23, ImageAsset.person),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    Language().kidLearning.toString(),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: Fonts.vietna,
                                      color: MyColor.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: size.width * 0.80,
                          splashColor: MyColor.blue.withOpacity(0.2),
                          onTap: () {
                            istabExplore = true;
                            setState(() {});
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const DashBoardScr(
                                          pageIndex: 4,
                                          tabcheck: "OurStories",
                                        )),
                                (Route<dynamic> route) => false);
                          },
                          minTileHeight: 40,
                          leading: SizedBox(
                            width: size.width *
                                0.80, // Adjust this value as per your layout needs
                            child: Row(
                              children: [
                                Image.asset(
                                    height: 23,
                                    width: 23,
                                    ImageAsset.overstories),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    Language().ourStories.toString(),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: Fonts.vietna,
                                      color: MyColor.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: size.width * 0.80,
                          splashColor: MyColor.blue.withOpacity(0.2),
                          onTap: () {
                            istabExplore = true;
                            setState(() {});
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MyKitsProfileShowscr()),
                                (Route<dynamic> route) => false);
                          },
                          minTileHeight: 40,
                          leading: SizedBox(
                            width: size.width *
                                0.80, // Adjust this value as per your layout needs
                            child: Row(
                              children: [
                                Image.asset(
                                  height: 23,
                                  width: 23,
                                  ImageAsset.kitslearningorange,
                                  color: MyColor.blue,
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    Language().myKids.toString(),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: Fonts.vietna,
                                      color: MyColor.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: size.width * 0.80,
                          splashColor: MyColor.blue.withOpacity(0.2),
                          onTap: () {
                            istabExplore = true;
                            setState(() {});
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FriendRequestScr()),
                                (Route<dynamic> route) => false);
                          },
                          minTileHeight: 40,
                          leading: SizedBox(
                            width: size.width *
                                0.80, // Adjust this value as per your layout needs
                            child: Row(
                              children: [
                                Image.asset(
                                  height: 23,
                                  width: 23,
                                  ImageAsset.addperson,
                                  color: MyColor.blue,
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    Language().friendRequest.toString(),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: Fonts.vietna,
                                      color: MyColor.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: Container(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: MyColor.blue,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "2",
                                      style: TextStyle(color: MyColor.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: size.width * 0.80,
                          splashColor: MyColor.blue.withOpacity(0.2),
                          onTap: () {
                            istabExplore = true;
                            setState(() {});
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const DashBoardScr(
                                          pageIndex: 4,
                                          tabcheck: "Aboutus",
                                        )),
                                (Route<dynamic> route) => false);
                          },
                          minTileHeight: 40,
                          leading: SizedBox(
                            width: size.width *
                                0.80, // Adjust this value as per your layout needs
                            child: Row(
                              children: [
                                Image.asset(
                                    height: 23, width: 23, ImageAsset.aboutus),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    Language().aboutUs.toString(),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: Fonts.vietna,
                                      color: MyColor.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: MyColor.colorDADADA,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Language().support.toString(),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            fontFamily: Fonts.vietna,
                            color: MyColor.black,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: size.width * 0.80,
                          splashColor: MyColor.blue.withOpacity(0.2),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EditProfilescr()),
                            );
                          },
                          minTileHeight: 40,
                          leading: SizedBox(
                            width: size.width *
                                0.80, // Adjust this value as per your layout needs
                            child: Row(
                              children: [
                                Image.asset(
                                    height: 23,
                                    width: 23,
                                    ImageAsset.editprofile),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    Language().editProfile.toString(),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: Fonts.vietna,
                                      color: MyColor.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: size.width * 0.80,
                          splashColor: MyColor.blue.withOpacity(0.2),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ChangePasswordscr()),
                            );
                          },
                          minTileHeight: 40,
                          leading: SizedBox(
                            width: size.width *
                                0.80, // Adjust this value as per your layout needs
                            child: Row(
                              children: [
                                Image.asset(
                                    height: 23,
                                    width: 23,
                                    ImageAsset.changepassword),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    Language().changePassword.toString(),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: Fonts.vietna,
                                      color: MyColor.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: size.width * 0.80,
                          splashColor: MyColor.blue.withOpacity(0.2),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HelpSupportscr()),
                            );
                          },
                          minTileHeight: 40,
                          leading: SizedBox(
                            width: size.width *
                                0.80, // Adjust this value as per your layout needs
                            child: Row(
                              children: [
                                Image.asset(
                                    height: 23, width: 23, ImageAsset.help),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    Language().helpSupport.toString(),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: Fonts.vietna,
                                      color: MyColor.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: size.width * 0.80,
                          splashColor: MyColor.red.withOpacity(0.2),
                          onTap: () {},
                          minTileHeight: 40,
                          leading: SizedBox(
                            width: size.width *
                                0.80, // Adjust this value as per your layout needs
                            child: Row(
                              children: [
                                Image.asset(
                                    height: 23, width: 23, ImageAsset.delete),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    Language().deleteAccount.toString(),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: Fonts.vietna,
                                      color: MyColor.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                            color: MyColor.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
