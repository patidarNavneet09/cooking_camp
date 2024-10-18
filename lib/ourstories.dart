import 'package:cooking_champs/addyourrecipe.dart';
import 'package:cooking_champs/addyourstories.dart';
import 'package:cooking_champs/constant/imagepoint.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/dashboard.dart';
import 'package:cooking_champs/storiesdetials.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class OurStoriesScr extends StatefulWidget {
  const OurStoriesScr({super.key});

  @override
  State<OurStoriesScr> createState() => _OurStoriesScrState();
}

class _OurStoriesScrState extends State<OurStoriesScr>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
      floatingActionButton: TouchRippleEffect(
        borderRadius: BorderRadius.circular(27),
        rippleColor: Colors.white,
        onTap: () {
          debugPrint(_tabController.index.toString());
          if (_tabController.index == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddYourStoriesScr()));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddYourRecipeScr()));
          }
        },
        child: const CircleAvatar(
          radius: 35,
          backgroundColor: MyColor.blue,
          child: Icon(
            Icons.add,
            size: 40,
            color: MyColor.white,
          ),
        ),
      ),
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
                Language().ourStories,
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
                      Language().story,
                      style: const TextStyle(
                        color: MyColor.color1C1C1C,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: Fonts.vietna,
                      ),
                    ))),
              ),
              Tab(
                child: SizedBox(
                    width: size.width * 0.50,
                    child: Center(
                        child: Text(
                      Language().recipe,
                      style: const TextStyle(
                        color: MyColor.color1C1C1C,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
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
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Best from the champs!",
                        style: TextStyle(
                          color: MyColor.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: Fonts.vietna,
                        ),
                      ),
                      Container(
                        height: 230,
                        margin: const EdgeInsets.only(bottom: 5),
                        // width: size.width,
                        // padding: const EdgeInsets.only(top: 5),
                        // color: Colors.amber,
                        alignment: Alignment.center,

                        child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, bottom: 0, top: 10),
                                child: TouchRippleEffect(
                                  borderRadius: BorderRadius.circular(10),
                                  rippleColor: Colors.white,
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const StoriesDetialsScr()),
                                    );
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: MyColor.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    width: size.width * 0.44,
                                    height: 230,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                            width: size.width * 0.52,
                                            ImageAsset.demo1),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Lorem Ipsum ",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: Fonts.vietna,
                                                  color: MyColor.black,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Lorem Ipsum is simply dummy text of the and typesetting.. ",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: Fonts.vietna,
                                                  color: MyColor.black,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Text(
                        Language().yourStories,
                        style: TextStyle(
                          color: MyColor.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: Fonts.vietna,
                        ),
                      ),
                      true != true
                          ? Container(
                              padding: EdgeInsets.only(top: 5),
                              height: 220,
                              child: Center(
                                child: Container(
                                    width: size.width * 0.90,
                                    height: 180,
                                    decoration: const BoxDecoration(
                                        color: MyColor.yellowF6F1E1,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            ImageAsset.nostories,
                                            height: 45,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            Language().nostoriesYet,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: Fonts.vietna,
                                              color: MyColor.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            Language()
                                                .youhaventaddedanystoriesyet,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                              fontFamily: Fonts.vietna,
                                              color: MyColor.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            )
                          : Container(
                              height: 230,
                              margin: const EdgeInsets.only(bottom: 5, top: 10),
                              // width: size.width,
                              // padding: const EdgeInsets.only(top: 5),
                              // color: Colors.amber,
                              alignment: Alignment.center,

                              child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5, bottom: 0, top: 0),
                                      child: TouchRippleEffect(
                                        borderRadius: BorderRadius.circular(10),
                                        rippleColor: Colors.white,
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const StoriesDetialsScr()),
                                          );
                                          setState(() {});
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: MyColor.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          width: size.width * 0.44,
                                          height: 230,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                  width: size.width * 0.52,
                                                  ImageAsset.demo1),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Lorem Ipsum ",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            Fonts.vietna,
                                                        color: MyColor.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "Lorem Ipsum is simply dummy text of the and typesetting.. ",
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontFamily:
                                                            Fonts.vietna,
                                                        color: MyColor.black,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                    ],
                  ),
                ),
                Center(
                  child: Text("It's rainy here"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
