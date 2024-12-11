import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class FoodChapter9View extends StatefulWidget {
  const FoodChapter9View({super.key});

  @override
  State<FoodChapter9View> createState() => _FoodChapter9ViewState();
}

class _FoodChapter9ViewState extends State<FoodChapter9View> {
  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Image and Title Section
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                 AssetsPath.foodChapter9Img1, // Replace with actual path
                  fit: BoxFit.cover,
                ),
                 Positioned(
                  top:50,
                  left: 10,
                  child: UiUtils().foodEnergyAppBar(onTap),
                ),
              ],
            ),
            hsized20,

            // Section Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children:  [
                  Text(
                    "There's a trick to make sure you get all the right energy to help you grow and stay strong and that is...",
                    textAlign: TextAlign.center,
                    style:boldTextStyle(fontSize:16.0, color:MyColor.pink)
                  ),

                 hsized8,
                  Text(
                    "Eat a rainbow every day!",
                    style:boldTextStyle(fontSize:20.0, color:MyColor.green)
                  ),
                  hsized8,
                  Text(
                    "Look at just a few of the ways the different colours make you healthier:",
                    textAlign: TextAlign.center,
                    style:regularNormalTextStyle(fontSize:14.0, color:MyColor.black)
                  ),
                ],
              ),
            ),
            hsized10,

            // Colored Sections with Benefits
            _buildColoredCard("Red fruits and veggies help keep your heart strong", Colors.red,MyColor.white,width:data.size.width * 0.8),
            _buildColoredCard("Orange fruits and veggies help keep your eyes healthy.", Colors.orange,MyColor.white),
            _buildColoredCard("Yellow fruits and veggies help keep you from getting sick.", Colors.yellow,MyColor.black, bold: true,width:data.size.width * 0.83),
            _buildColoredCard("Green fruits and veggies help healing.", Colors.green,MyColor.white,width:data.size.width * 0.75),
            _buildColoredCard("Blue and purple fruits and veggies help your digestion and memory.", Colors.deepPurple,MyColor.white),
            _buildColoredCard("White fruit and veggies make healthy bones", Colors.white,MyColor.black),

            const SizedBox(height: 20),

            // Smiley Face Section
            Image.asset(
              AssetsPath.foodChapter9Img2, // Replace with actual path
              height: 130,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for colored cards
  Widget _buildColoredCard(String text, Color color,Color textColor, {bool bold = false,double width = double.infinity}) {
    return Container(
      margin: const EdgeInsets.symmetric( horizontal:20.0),
      padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 5),
      width:width ,
      decoration: BoxDecoration(
        color: color,
      //  borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        text,
        style:semiBoldTextStyle(fontSize:14.0, color:textColor),
        textAlign: TextAlign.center,
      ),
    );
  }

  void onTap() {
    Navigator.pop(context);
  }
}
