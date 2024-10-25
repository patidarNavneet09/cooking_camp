import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class FriendRequestScr extends StatefulWidget {
  const FriendRequestScr({super.key});

  @override
  State<FriendRequestScr> createState() => _FriendRequestScrState();
}

class _FriendRequestScrState extends State<FriendRequestScr>
    with TickerProviderStateMixin {
  // <<<<<<<Controller >>>>>>

  TextEditingController searchControllerone = TextEditingController();
  TextEditingController searchControllertwo = TextEditingController();
  TextEditingController searchControllerthree = TextEditingController();
  dynamic _isFocusedcolor = '';
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // floatingActionButton: TouchRippleEffect(
      //   borderRadius: BorderRadius.circular(27),
      //   rippleColor: Colors.white,
      //   onTap: () {
      //     debugPrint(_tabController.index.toString());
      //     if (_tabController.index == 0) {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => const AddYourStoriesScr()));
      //     } else {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => const AddYourRecipeScr()));
      //     }
      //   },
      //   child: const CircleAvatar(
      //     radius: 35,
      //     backgroundColor: MyColor.blue,
      //     child: Icon(
      //       Icons.add,
      //       size: 40,
      //       color: MyColor.white,
      //     ),
      //   ),
      // ),
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
                        builder: (context) => const DashBoardScr(
                              pageIndex: 0,
                            )),
                  );
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
                Language().friendRequest,
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
        children: [
          TabBar(
            dividerColor: MyColor.colorE5E9F4,
            indicatorColor: MyColor.blue,
            controller: _tabController,
            onTap: (value) {
              debugPrint(_tabController.index.toString());
            },
            tabs: <Widget>[
              Tab(
                child: SizedBox(
                    width: size.width * 0.50,
                    child: Center(
                        child: Text(
                      Language().myFriends,
                      style: const TextStyle(
                        color: MyColor.color1C1C1C,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: Fonts.vietna,
                      ),
                    ))),
              ),
              Tab(
                child: SizedBox(
                    width: size.width * 0.50,
                    child: Center(
                        child: Text(
                      Language().request,
                      style: const TextStyle(
                        color: MyColor.color1C1C1C,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: Fonts.vietna,
                      ),
                    ))),
              ),
              Tab(
                child: SizedBox(
                    width: size.width * 0.70,
                    child: Center(
                        child: Text(
                      Language().searchFriends,
                      style: const TextStyle(
                        color: MyColor.color1C1C1C,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: Fonts.vietna,
                      ),
                    ))),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(12, 5, 12, 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: _isFocusedcolor == "firstName"
                                  ? MyColor.colorD8DCE4
                                  : MyColor.graylite),
                          color: const Color.fromARGB(255, 237, 239, 241),
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
                          controller: searchControllerone,

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
                            hintText: Language().searchbyname.toString(),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: MyColor.black,
                                  size: 35,
                                ),
                                onPressed: () {
                                  // setState(() {
                                  //   _obscureTextpassword = !_obscureTextpassword;
                                  // });
                                },
                              ),
                            ),
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
                        height: size.height * 0.72, //
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics:
                              const ClampingScrollPhysics(), // Prevents bouncing on scroll
                          itemCount: 13,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: MyColor.white,
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
                                          padding: const EdgeInsets.only(
                                              left: 5, top: 10),
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
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(12, 5, 12, 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: _isFocusedcolor == "firstName"
                                  ? MyColor.colorD8DCE4
                                  : MyColor.graylite),
                          color: const Color.fromARGB(255, 237, 239, 241),
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
                          controller: searchControllertwo,

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
                            hintText: Language().searchbyname.toString(),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: MyColor.black,
                                  size: 35,
                                ),
                                onPressed: () {
                                  // setState(() {
                                  //   _obscureTextpassword = !_obscureTextpassword;
                                  // });
                                },
                              ),
                            ),
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
                        height: size.height * 0.72, //
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics:
                              const ClampingScrollPhysics(), // Prevents bouncing on scroll
                          itemCount: 13,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 5, bottom: 5),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: MyColor.white,
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
                                          padding: const EdgeInsets.only(
                                              left: 5, top: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: size.width * 0.55,
                                                    child: const Text(
                                                      "Andrew Robert",
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            Fonts.vietna,
                                                        color: MyColor.black,
                                                      ),
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
                                                                // Navigator.of(
                                                                //         context)
                                                                //     .push(
                                                                //   MaterialPageRoute(
                                                                //       builder:
                                                                //           (context) =>
                                                                //               const KitsRegistredscr(
                                                                //                 check: true,
                                                                //                 editcheck: true,
                                                                //               )),
                                                                // );
                                                              },
                                                              child:
                                                                  CircleAvatar(
                                                                      radius:
                                                                          15,
                                                                      backgroundColor:
                                                                          MyColor
                                                                              .blue,
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .check,
                                                                        color: MyColor
                                                                            .white,
                                                                      ))),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          CircleAvatar(
                                                              radius: 15,
                                                              backgroundColor:
                                                                  MyColor.red,
                                                              child: Icon(
                                                                Icons.close,
                                                                color: MyColor
                                                                    .white,
                                                              ))
                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
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
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(12, 5, 12, 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: _isFocusedcolor == "firstName"
                                  ? MyColor.colorD8DCE4
                                  : MyColor.graylite),
                          color: const Color.fromARGB(255, 237, 239, 241),
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
                          controller: searchControllerthree,

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
                            hintText: Language().searchbyname.toString(),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: MyColor.black,
                                  size: 35,
                                ),
                                onPressed: () {
                                  // setState(() {
                                  //   _obscureTextpassword = !_obscureTextpassword;
                                  // });
                                },
                              ),
                            ),
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
                        height: size.height * 0.72, //
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics:
                              const ClampingScrollPhysics(), // Prevents bouncing on scroll
                          itemCount: 13,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: MyColor.white,
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
                                          padding: const EdgeInsets.only(
                                              left: 5, top: 10),
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
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                ],
                              ),
                            );
                          },
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
    );
  }
}
