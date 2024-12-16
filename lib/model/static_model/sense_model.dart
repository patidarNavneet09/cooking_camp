import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:flutter/material.dart';

class SenseModel {
  final String title;
  final String description;
  final String imagePath;
  final Color color;

  SenseModel({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.color,
  });
}

List<SenseModel> getSenseList(){
  // List of senses
 return [
    SenseModel(
      title: "1.Sight",
      description:
      "is probably the one we are most aware of and it is very important in the kitchen. Your eyes can quickly tell you if something is unsafe and they can also tell you if something isn’t good to eat.   If food looks funny, or has changed colour it’s a sign that germs might be hiding in or on it.   DON’T eat it!",
      imagePath:AssetsPath.lookImg1, // Replace with your image path
       color:MyColor.black
    ),
    SenseModel(
      title: "2.Smell",
      description:
      "Your nose is really important in the   kitchen because it can tell you if something is nice to eat or plane old bad! If it smells bad or different to how it usually smells those germs might be hanging around waiting to be gobbled up! So DON’T eat it!  Sometimes we can smell something wrong before we see it. We might smell smoke before we see fire. Have you heard the expression “Where there is smoke there is fire.”?",
      imagePath: AssetsPath.lookImg2,
        color:MyColor.green
    ),
    SenseModel(
      title: "3.Touch",
      description:
      "If it’s a little too mushy and our other senses tell you it’s ok, it might be good for soup or to make a smoothie.  But if your other senses are sending out alarm bells be safe and DON’T eat it.",
      imagePath:AssetsPath.lookImg3,
        color:MyColor.sky
    ),
    SenseModel(
      title: "4.Taste",
      description:
      "tells us if something is salty or sweet, sour or bitter. It also tells us if something isn’t quite right and that might mean that germs are starting to fester.  If you think something tastes different to how it usually tastes. If it’s not quite right, you guessed it.  DON’T eat it!",
      imagePath:AssetsPath.lookImg4,
        color:MyColor.red1
    ),
    SenseModel(
      title: "5.Hearing",
      description:
      "Listening is always important and it’s very important in the kitchen. Often we hear before we see! You can hear if food is boiling or spilling.You can hear if something is breaking.And don’t forget that you can hear important instructions!",
      imagePath:AssetsPath.lookImg5,
        color:MyColor.darkYellow2
    ),
  ];
}