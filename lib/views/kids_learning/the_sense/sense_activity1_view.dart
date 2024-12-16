import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/model/static_model/sense_match_item.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/the_sense/sense_activity2_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class SenseActivity1View extends StatefulWidget {
  const SenseActivity1View({super.key});

  @override
  State<SenseActivity1View> createState() => SenseActivity1ViewState();
}

class SenseActivity1ViewState extends State<SenseActivity1View> {
  // Tracks which items are matched correctly
  List<SenseMatchItem?> targetList = [];
  List<SenseMatchItem> draggableList = [];

  @override
  void initState() {
    // Initialize the draggable and target lists
    draggableList = items();
    targetList = List<SenseMatchItem?>.filled(draggableList.length, null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: Column(
          children: [
            hsized40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiUtils.hygieneAppBar(()=> Navigator.pop(context),text: "Activity 5.1",color: MyColor.black),
                UiUtils.bookReadGirl(MyColor.red1,AssetsPath.bookReadImg)
              ],
            ),

            UiUtils.buildBoldText(
              "Match the word to the picture senses",
              color: MyColor.red1,
              fontSize: 23.0,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    hsized30,
                    Row(
                      children: [
                        // Left side: Draggable Images
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: draggableList.map((item) {
                            return Draggable<SenseMatchItem>(
                              data: item,
                              feedback: Material(child: buildImageItem(item)),
                              childWhenDragging: Opacity(
                                opacity: 0.3,
                                child: buildImageItem(item),
                              ),
                              child: buildImageItem(item),
                            );
                          }).toList(),
                        ),

                        const SizedBox(width: 10),

                        // Right side: Drag Target Words
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(targetList.length, (index) {
                              final item = targetList[index];
                              return DragTarget<SenseMatchItem>(
                                onWillAccept: (data) {
                                  // Check if the target is empty and the dragged item's answer matches this target
                                  return targetList[index] == null && draggableList[index].answer == data!.word;
                                },
                                onAccept: (data) {
                                  setState(() {
                                    // Replace the targetList entry at this index with the accepted item
                                    targetList[index] = data;

                                    // Remove the matched item from the draggable list
                                    draggableList.removeWhere((item) => item.word == data.word);
                                  });
                                },
                                builder: (context, candidateData, rejectedData) {
                                  if (targetList[index] == null) {
                                    // Show the empty target slot with the word
                                    return buildWordTarget(draggableList[index].word);
                                  } else {
                                    // Show completed target if matched
                                    return buildCompletedTarget(targetList[index]!.word);
                                  }
                                },
                              );
                            }),
                          ),
                        ),
                      ],
                    ),

                    hsized60,
                    GlobalButton(Languages.of(context)!.submit,MyColor.red1,MyColor.red1,btnSize55, double.infinity,()=> CustomNavigators.pushNavigate(SenseActivity2View(),context),
                        55, 0, 0, semiBoldTextStyle(fontSize:18.0, color:MyColor.white))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build draggable image with dotted borders
  Widget buildImageItem(SenseMatchItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: 123,
      height: 70,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: DottedBorder(
              radius: const Radius.circular(8),
              dashPattern: [4, 2],
              color: MyColor.red1,
              borderType: BorderType.RRect,
              child: Center(child: Image.asset(item.imagePath, width: 60, height: 60)),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child:Image.asset(AssetsPath.dots, color: MyColor.red1,height:50,width:50),
          ),
        ],
      ),
    );
  }

  // Helper to build empty word target
  Widget buildWordTarget(String word) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 70,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: DottedBorder(
              radius: const Radius.circular(8),
              dashPattern: [4, 2],
              color: MyColor.red1,
              borderType: BorderType.RRect,
              child: Container(
                padding: const EdgeInsets.only(left: 25.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  word,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(AssetsPath.dots, color: MyColor.red1,height:50,width:50),
          ),
        ],
      ),
    );
  }

  // Helper to build completed target
  Widget buildCompletedTarget(String word) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 70,
      child: Stack(
        children: [
          DottedBorder(
            radius: const Radius.circular(8),
            dashPattern: [4, 2],
            color: MyColor.red1,
            borderType: BorderType.RRect,
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '$word ✓',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child:Image.asset(AssetsPath.dots, color: MyColor.red1,height:50,width:50),
          ),
        ],
      ),
    );
  }
}
