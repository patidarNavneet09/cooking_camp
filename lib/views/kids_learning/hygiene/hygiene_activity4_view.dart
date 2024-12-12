import 'package:flutter/material.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';

class HygieneActivity4 extends StatelessWidget {
  const HygieneActivity4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      appBar: AppBar(
        backgroundColor: MyColor.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MyColor.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Activity 3.4",
          style: TextStyle(color: MyColor.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Science experiment about germs",
                style: boldTextStyle(fontSize: 20.0, color: MyColor.green),
              ),
              hsized10,
              Text(
                "How Do Germs Spread?",
                style: boldTextStyle(fontSize: 17.0, color: MyColor.appTheme),
              ),
              hsized8,
              Text(
                "This experiment shows how germs and viruses can live on our hands and be passed from person to person. Choose a partner before you start.",
                style: regularNormalTextStyle(fontSize: 16.0, color: MyColor.black),
              ),
              hsized20,
              Text(
                "You Need",
                style: boldTextStyle(fontSize: 17.0, color: MyColor.appTheme),
              ),
              hsized8,
              Text(
                "Hand lotion, Glitter, Large bucket, Paper towels, Soap and warm water.",
                style: regularNormalTextStyle(fontSize: 16.0, color: MyColor.black),
              ),
              hsized20,
              Text(
                "What You Do",
                style: boldTextStyle(fontSize: 17.0, color: MyColor.appTheme),
              ),
              hsized8,
              _buildStep("1", "Put a drop of lotion on your hands and rub them together to spread the lotion out evenly."),
              _buildStep("2", "With your hands over a sink or large bucket, have partner 2 put a pinch of glitter in the palm of one partner's hand."),
              _buildStep("3", "Now press the palms of your hands together or pull your fingers. What do you notice about your hands?"),
              _buildStep("4", "Shake your partner's hand. Now do you see anything on it?"),
              _buildStep("5", "Check your partner's hand."),
              _buildStep("6", "Get a paper towel and use it to wipe your hands clean of all the glitter. Is it working?"),
              _buildStep("7", "After using the paper towel,"),
              _buildStep("8", "Wash your hands with soap and water. Did it get the glitter off?"),
              hsized20,
              Text(
                "What Happened?",
                style: boldTextStyle(fontSize: 17.0, color: MyColor.appTheme),
              ),
              hsized8,
              _buildBulletPoint("When you touched your friend's hands?"),
              _buildBulletPoint("Did the glitter spread to anything else you touched?"),
              _buildBulletPoint("Did the paper towel remove all the glitter?"),
              _buildBulletPoint("Did the soap and warm water remove the glitter?"),
              hsized10,
              Text(
                "Germs are much like the glitter. This experiment shows that germs are hard to see and spread easily. It’s really important that you wash your hands thoroughly to stop the spread of germs and avoid getting sick!",
                style: regularNormalTextStyle(fontSize: 16.0, color: MyColor.black),
              ),
              hsized20,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(String stepNumber, String stepDescription) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$stepNumber. ",
            style: boldTextStyle(fontSize: 16.0, color: MyColor.appTheme),
          ),
          Expanded(
            child: Text(
              stepDescription,
              style: regularNormalTextStyle(fontSize: 16.0, color: MyColor.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "• ",
            style: TextStyle(fontSize: 18.0, color: MyColor.appTheme),
          ),
          Expanded(
            child: Text(
              description,
              style: regularNormalTextStyle(fontSize: 16.0, color: MyColor.black),
            ),
          ),
        ],
      ),
    );
  }
}
