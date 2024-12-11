import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class FoodGlossaryView extends StatelessWidget {
  const FoodGlossaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MyColor.white,
      appBar:AppBar(
        backgroundColor:MyColor.white,
        leading: Padding(
          padding: const EdgeInsets.only(left:20.0),
          child: InkWell(
            onTap:()=> Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios, size: 24),
          ),
        ),
        title: Text(
          Languages.of(context)!.glossary,
          style: mediumTextStyle(fontSize: 18.0, color: MyColor.black),
        ) ,
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UiUtils.buildParagraph("","Balanced diet:", " The right amount of a variety of food and water. Gives you energy and keeps you healthy.",color: MyColor.black),
             hsized10,
              UiUtils.buildParagraph("","Digest:", " When your body changes food into energy.",color: MyColor.black),

              hsized10,
              UiUtils.buildParagraph("","Digestive system: ", "All the parts of the body that work together to change food to energy.",color: MyColor.black),

             hsized10,
              UiUtils.buildParagraph("","Energy: ", "Is the Power we need to live. Our body needs energy to work. Other types of energy include electrical energy and mechanical energy.",color: MyColor.black),

              hsized10,
              UiUtils.buildParagraph("","Experiment: ", "Is an activity people do to learn about the world around us.",color: MyColor.black),

              hsized10,
              UiUtils.buildParagraph("","Healthy: ", "When you are healthy you feel strong and good and are not sick.",color: MyColor.black),

              hsized10,
              UiUtils.buildParagraph("","Hypothesis: ", "A guess you make about what is going to happen in an experiment before you have done it.",color: MyColor.black),

              hsized10,
              UiUtils.buildParagraph("","Nutrients: ", "Something in food that helps people, animals, and plants live and grow. If you don’t get enough nutrients, you may feel tired and become sick.",color: MyColor.black),

              hsized10,
              UiUtils.buildParagraph("","Stomach: ", "The stomach is where food is churned up and changed to energy.",color: MyColor.black),

              hsized10,
              UiUtils.buildParagraph("","Rainbow: ", "An arc of colours that appears when sunlight passes through bits of water in the air.",color: MyColor.black),

              hsized10,
              UiUtils.buildParagraph("","Variety: ", "Different types, assortment.",color: MyColor.black),



            ],
          ),
        ),
      ),
    );
  }
}
