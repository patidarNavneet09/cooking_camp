import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/model/static_model/sense_model.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/the_sense/the_sense_view.dart';
import 'package:flutter/material.dart';

class SenseChapter3View extends StatefulWidget {
  const SenseChapter3View({super.key});

  @override
  State<SenseChapter3View> createState() => _SenseChapter3ViewState();
}

class _SenseChapter3ViewState extends State<SenseChapter3View> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiUtils.buildBoldText("Let’s Look", color: MyColor.red1,fontSize:20.0),
            hsized15,
            buildPageContent(),
            hsized100
          ],
        ),
      ),
    );
  }


  Widget buildPageContent() {
    final senses = getSenseList();
    final halfLength = (senses.length / 3).ceil();

    // First page = first half of senses, second page = remaining senses
    final List<SenseModel> pageSenses = senseCurrentPage == 2
        ? senses.sublist(0, halfLength)
        : senses.sublist(halfLength);

    return Column(
      children: pageSenses.map((sense) {
        return buildSenseCard(sense);
      }).toList(),
    );
  }


  // Widget to display a sense as a card
  Widget buildSenseCard(SenseModel sense) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(sense.imagePath, width:83, height:83),
        hsized5,
        UiUtils.buildParagraph("", sense.title, " ${sense.description}",color:sense.color,regularColor:sense.color,highlightFontSize:20.0,regularFontSize: 16.0,),
        hsized25,
      ],
    );
  }
}
