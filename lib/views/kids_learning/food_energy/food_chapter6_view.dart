import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class FoodChapter6View extends StatelessWidget {
  const FoodChapter6View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextWithImage(
                    title: "Your stomach",
                    description:
                    "Your stomach is the place where incredible things happen.",
                    imagePath: AssetsPath.foodChapter6Img1,
                    imageHeight: 180,
                    imageWidth: 170,
                  ),
                  _buildImageWithText(
                    imagePath: AssetsPath.foodChapter6Img2,
                    description:
                    "When you chew and swallow and the food travels to your stomach.",
                    imageHeight: 155,
                    imageWidth: 220,
                  ),
                  _buildDescription(
                    "That’s where the food you eat is transformed to nutrients that your body needs to work and stay alive.",
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                    child: UiUtils.buildFunFact(
                      title: "Fun Fact",
                      fact:
                      "Our salivary glands produce around 1.5 litres of saliva each day!",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// App Header with Back Button
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, bottom: 10, left: 20, right: 20),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios, size: 28),
          ),
          const SizedBox(width: 10),
          Text(
            "Food is energy",
            style: mediumTextStyle(fontSize: 18.0, color: MyColor.black),
          ),
        ],
      ),
    );
  }

  /// Section with Text on Left and Image on Right
  Widget _buildTextWithImage({
    required String title,
    required String description,
    required String imagePath,
    required double imageHeight,
    required double imageWidth,
  }) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: boldTextStyle(fontSize: 23.0, color: MyColor.pink),
                ),
                Text(
                  description,
                  style: boldTextStyle(fontSize: 15.5, color: MyColor.green),
                ),
              ],
            ),
          ),
        ),
        Image.asset(imagePath, height: imageHeight, width: imageWidth),
      ],
    );
  }

  /// Section with Image on Left and Text on Right
  Widget _buildImageWithText({
    required String imagePath,
    required String description,
    required double imageHeight,
    required double imageWidth,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 20),
        Image.asset(imagePath, height: imageHeight, width: imageWidth),
        const SizedBox(width: 5),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              description,
              style: boldTextStyle(fontSize: 15.5, color: MyColor.darkBlue),
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  /// Centered Description Text
  Widget _buildDescription(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          hsized20,
          Text(
            text,
            textAlign: TextAlign.center,
            style: boldTextStyle(fontSize: 15.5, color: MyColor.sky1),
          ),
          hsized20,
        ],
      ),
    );
  }

}
