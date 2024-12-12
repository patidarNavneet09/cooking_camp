import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/kids_learning_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class FoodActivity7View extends StatefulWidget {
  const FoodActivity7View({super.key});

  @override
  State<FoodActivity7View> createState() => _FoodActivity7ViewState();
}

class _FoodActivity7ViewState extends State<FoodActivity7View> {
  String image = AssetsPath.bookReadImg;
  String title = "Activity 2.7";
  bool isActivity = false;
  Color color = MyColor.pink;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 35,bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiUtils().foodEnergyAppBar(() =>back(),
                    text: title),
                UiUtils.bookReadGirl(color,image)
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  isActivity?
                      activity8View():activity7View()
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: !isActivity?null: Padding(padding: EdgeInsets.only(left:20,right:20,bottom: 60),child:GlobalButton(Languages.of(context)!.submit,MyColor.appTheme,MyColor.appTheme,btnSize55,double.infinity,
              ()=>onTap(),
          55,0,0,semiBoldTextStyle(fontSize:18.0, color:MyColor.white)) ,),
    );
  }

  activity7View(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          UiUtils.buildBoldText("Take a look at the food in this Picture.", fontSize: 23.0, color: MyColor.pink),
          hsized10,
          Image.asset(AssetsPath.foodActivity7Img),
          hsized20,
          textField("How many colours do you see?"," What are they?"),

          hsized20,
          textField("Are there any vegetables in this meal?"," What are they?"),

          hsized20,
          textField("Do you think it looks like a balanced meal?"," Why not?"),

          UiUtils.buildJokeSection("Q. What time do you go to the dentist?","A. At tooth-hurty! HE! HE!"),

          hsized30,
          GlobalButton(Languages.of(context)!.submit,MyColor.appTheme,MyColor.appTheme,btnSize55,double.infinity,
                  ()=>onTap(),
              55,0,0,semiBoldTextStyle(fontSize:18.0, color:MyColor.white)),
          hsized80,
        ],
      ),
    );
  }

  activity8View(){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10),
      child: UiUtils.buildBoldText("Go to page 198 to colour in the rainbow at the back of the book please.", fontSize: 23.0, color: MyColor.pink),
    );
  }

  textField(String lightText,String highlightText){
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [

        UiUtils.buildParagraph(lightText,highlightText, "",color: MyColor.black,regularFontSize:15.0),

        Stack(
          children: [
            for (int i = 0; i < 1; i++)
              Container(
                margin: EdgeInsets.only(
                  top: 4 + (i + 1) * 28,
                ),
                decoration: const BoxDecoration(
                  border: DashedBorder(
                    dashLength: 5,
                    left: BorderSide.none,
                    top: BorderSide.none,
                    right: BorderSide.none,
                    bottom: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
              ),
            SizedBox(
              height:50,
              child: TextField(
                scrollPhysics: NeverScrollableScrollPhysics(),
                decoration: InputDecoration(border: InputBorder.none),
                cursorHeight: 12,
                onTapOutside: (v){
                  FocusManager.instance.primaryFocus!.unfocus();
                },
                style: TextStyle(
                  fontSize: 20.0,
                ),
                keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 1
              ),
            ),
          ],
        ),
      ],
    );
  }

  onTap() {
    if(title == "Activity 2.7"){
      setState(() {
        color = MyColor.darkSky;
        isActivity = true;
        title = "Activity 1.8";
        image = AssetsPath.readBookBoy;
      });
    }else{
      CustomNavigators.pushRemoveUntil(KidsLearningView(type: 'Food Activity',), context);
    }

  }

  back() {
    if(title == "Activity 1.8"){
      setState(() {
      color = MyColor.pink;
      isActivity = false;
      title = "Activity 2.7";
      image = AssetsPath.bookReadImg;
      });
    }else{
      Navigator.pop(context);
    }
  }
}
