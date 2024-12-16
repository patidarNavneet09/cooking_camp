import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/views/kids_learning/about_fruit/about_fruit_view.dart';
import 'package:cooking_champs/views/kids_learning/all_about_vegetables/about_vegetable_view.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/food_energy_view.dart';
import 'package:cooking_champs/views/kids_learning/hygiene/hygine_view.dart';
import 'package:cooking_champs/views/kids_learning/safty_kitchen_view.dart';
import 'package:cooking_champs/views/kids_learning/the_basic/the_basic_view.dart';
import 'package:cooking_champs/views/kids_learning/the_sense/the_sense_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

import '../dashboard.dart';

class KidsLearningView extends StatefulWidget {
 final String type ;
  const KidsLearningView({super.key,required this.type});

  @override
  State<KidsLearningView> createState() => _KidsLearningViewState();
}

class _KidsLearningViewState extends State<KidsLearningView> {
  bool navigateSafetyKic = false;
List<KidsLearningModel> topicList  =[];
  @override
  void initState() {
    super.initState();
    navigateSafetyKic = true;
  }
  setKidsLearning(){
    setState(() {
      topicList = [
        KidsLearningModel("SAFETY IN THE KITCHEN", AssetsPath.safety,),
        KidsLearningModel("FOOD IS ENERGY", AssetsPath.food,),
        KidsLearningModel("ALL ABOUT HYGIENE",AssetsPath.allAboutHygiene),
        KidsLearningModel("THE BASIC",AssetsPath.theBasic),
        KidsLearningModel("THE SENSES",AssetsPath.theSenses),
        KidsLearningModel("ALL ABOUT VEGETABLES",AssetsPath.allAboutVegetables),
        KidsLearningModel("ALL ABOUT FRUITS",AssetsPath.allAboutFruits),
        KidsLearningModel("HONEYBEES & HONEY",AssetsPath.honeybees),
        KidsLearningModel("NUTS ABOUT NUTS",AssetsPath.nuts),
        KidsLearningModel("CELEBRATION",AssetsPath.celebration),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    setKidsLearning();
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          tabCheck = "";
          pageIndex = 0;
        });
        return true;
      },
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      backgroundColor: MyColor.yellowF6F1E1,
      surfaceTintColor: MyColor.yellowF6F1E1,
      title: Row(
        children: [
          InkWell(
            radius: 80,
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              if(widget.type == "Food Activity" || widget.type == "Hygiene"){
                setState(() {
                  pageIndex = 0;
                  tabCheck = "";
                  isTabExplore = false;
                });
                CustomNavigators.pushRemoveUntil(DashBoardView(pageIndex: 0,), context);
              }else{
                setState(() {
                  pageIndex = 0;
                  tabCheck = "";
                  isTabExplore = false;
                });
              }

            },
            child: const Padding(
              padding: EdgeInsets.only(left: 5.0, right: 10),
              child: Icon(
                Icons.arrow_back_ios,
                size: 28,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            Languages.of(context)!.kidsLearning,
            style: mediumTextStyle(fontSize: 18.0, color: MyColor.black),
          ),
        ],
      ),
      centerTitle: true,
      elevation: 0,
    );
  }

  Widget _buildBody(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ResponsiveGridRow(
          children: List.generate(topicList.length, (index) {
            return ResponsiveGridCol(
              xs: 6,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TouchRippleEffect(
                  borderRadius: BorderRadius.circular(27),
                  rippleColor: Colors.white,
                  onTap: () => _handleTileTap(context,index),
                  child: _buildGridTile(index == 2 || index == 4?MyColor.white: MyColor.black, topicList[index].img, topicList[index].title),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void _handleTileTap(BuildContext context,int index) {

    if (navigateSafetyKic) {
      if(index == 0){
        CustomNavigators.pushNavigate(SafetyKitchenView(), context);
      }else if(index == 1){
        CustomNavigators.pushNavigate(FoodEnergyView(), context);
      }else if(index == 2){
        CustomNavigators.pushNavigate(AllAboutHygieneView(), context);
      }else if(index == 3){
        CustomNavigators.pushNavigate(TheBasicView(), context);
      }
      else if(index == 4){
        CustomNavigators.pushNavigate(TheSenseView(), context);
      }else if(index == 5){
        CustomNavigators.pushNavigate(AboutVegetableView(), context);
      }else if(index == 6){
        CustomNavigators.pushNavigate(AboutFruitView(), context);
      }
      vegetableCurrentPage = 0;
      senseCurrentPage = 0;
      basicCurrentPage = 0;
      hygieneCurrentPage = 0;
      currentPage = 0;
      currentIndex = 0;
      setState(() {});
    }
  }

  Widget _buildGridTile(Color color, String imagePath, String title) {
    return Stack(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child:Image.asset(imagePath, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            title,
            style:regularTextStyle(fontSize:16.0, color: color)
          ),
        ),
      ],
    );
  }
}

class KidsLearningModel{
  String title;
  String img;

  KidsLearningModel(this.title, this.img);
}
