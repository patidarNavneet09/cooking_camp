import 'package:cooking_champs/addyourrecipe.dart';
import 'package:cooking_champs/addyourstories.dart';
import 'package:cooking_champs/constant/mycolor.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/dashboard.dart';
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
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Best from the champs!",
                        style: const TextStyle(
                          color: MyColor.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: Fonts.vietna,
                        ),
                      )
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
