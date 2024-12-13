import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/food_energy/foodRecipeActivityView.dart';
import 'package:cooking_champs/views/kids_learning/go_to_page_number_view.dart';
import 'package:cooking_champs/views/kids_learning/hygiene/hygiene_activity4_view.dart';
import 'package:cooking_champs/views/kids_learning/kids_recipe_view.dart';
import 'package:cooking_champs/views/kids_learning/quiz_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';


class BasicActivity3View extends StatefulWidget {
  const BasicActivity3View({super.key});

  @override
  State<BasicActivity3View> createState() => _BasicActivity3ViewState();
}

class _BasicActivity3ViewState extends State<BasicActivity3View> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:30.0,bottom:20,left:20,right:20),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiUtils.hygieneAppBar(()=> Navigator.pop(context),color:MyColor.black,text:"Activity 4.3"),

                UiUtils.bookReadGirl(MyColor.appTheme,AssetsPath.bookReadImg)
              ],
            ),
          ),


          Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal:20),
                child: Column(
                  children: [
                    UiUtils.buildBoldText("Look at the Tools Chart and list all tools we need for measuring.",color:MyColor.appTheme,fontSize:23.0),

                    QuizQuestion(questionNumber:"", questionText:"",controller: controller,maxLine:9,),

                    hsized80,

                  ],
                ),))
        ],
      ),
      bottomSheet: Padding(padding: EdgeInsets.only(bottom:50,left: 20,right:20),
          child:   GlobalButton(Languages.of(context)!.submit,MyColor.appTheme,MyColor.appTheme,btnSize55,double.infinity,
                  (){
            setState(() {
                      sweetLassiData();
                    });
            CustomNavigators.pushNavigate(KidsRecipeView(recipeName:"Punjab Sweet Lassi", recipe:recipeModel, appBarTitle: "Activity 4.5",color:MyColor.appTheme,),context);},
              55,0,0,semiBoldTextStyle(fontSize:18.0, color:MyColor.white))),
    );
  }
}
