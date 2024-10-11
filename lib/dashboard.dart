import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/home.dart';
import 'package:cooking_champs/recipe.dart';
import 'package:cooking_champs/save.dart';
import 'package:flutter/material.dart';

class DashBoardScr extends StatefulWidget {
  final int? pageIndex;
  const DashBoardScr({super.key, this.pageIndex});

  @override
  State<DashBoardScr> createState() => _DashBoardScrState();
}

class _DashBoardScrState extends State<DashBoardScr> {
  bool? isLogin = false;
  // pages count & variable assign >>>>>>>>>
  int pageIndex = 0;
  var pages = [
    const HomeScr(),
    const RecipeScr(),
    const SaveScr(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildMyNavBar(context),
      body: pageIndex == 3 ? pages[2] : pages[pageIndex],
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
                                  color: pageIndex != 0
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
                        pageIndex = 3;
                        // } else {
                        // showdialog();
                        // }
                        // print(pageIndex);
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              // <-- SEE HERE
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20.0),
                              ),
                            ),
                            context: context,
                            builder: ((builder) => bottomSheet1()));
                        setState(() {});
                      },
                      child: Container(
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
    return Container(
      height: size.height * 0.80,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 100,
            height: 10,
            decoration: BoxDecoration(
                color: MyColor.litegrayB5B5B5,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Container(
            width: size.width * 0.80,
            height: 10,
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
