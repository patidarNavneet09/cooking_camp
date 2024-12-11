import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class FoodChapter4View extends StatelessWidget {
  const FoodChapter4View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle("Digestion"),
                  _buildText(
                      "It all starts from the time you see and smell food and your mouth fills with saliva."),
                  _buildActivityBox(),
                  hsized10,
                  _buildImage(AssetsPath.foodChapter4Img2,height:300),
                  _buildSectionTitle("Teeth"),
                  _buildText(
                      "Your teeth then get to do their important work of breaking down the food by chewing and crushing the food into small enough pieces for you to swallow.\n\nIt's very important to keep your teeth hard and strong so they can do their job."),
                  hsized20,
                  _buildImageWithText(
                      AssetsPath.foodChapter4Img3,
                      [
                        "If teeth are not brushed well they are covered by PLAQUE.",
                        "Plaque is a sticky, colourless layer of bacteria and sugars that forms on our teeth.",
                        "Plaque is the main cause of cavities and gum disease."
                      ]),
                  hsized20,
                  _buildImageWithText(
                      AssetsPath.foodChapter4Img4,
                      [
                        "Bacteria feed on the plaque and they release an acid that causes DECAY.",
                        "If you don't take care of your teeth the decay makes your teeth rot and even fall out!"
                      ],
                      imageOnRight: false),
                  hsized20,
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                    child: UiUtils.buildFunFact(
                      title: "Fun Fact",
                      fact:
                      "An elephant’s tooth can weigh as much as three kilograms!! WOW!!",
                    ),
                  ),
                  _buildJokeSection(),
                  hsized45,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the header with back button and title
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, bottom: 20, left: 20, right: 20),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios, size: 28),
          ),
          const SizedBox(width: 10),
          Text("Food is energy",
              style: mediumTextStyle(fontSize: 18.0, color: MyColor.black)),
        ],
      ),
    );
  }

  /// Title Text Widget
  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(title,
          textAlign: TextAlign.center,
          style: boldTextStyle(fontSize: 25.0, color: MyColor.pink)),
    );
  }

  /// Text Content Widget
  Widget _buildText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(text,
          style: semiBoldTextStyle(fontSize: 16.0, color: MyColor.sky)),
    );
  }

  /// Section Title Widget
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(title,
          style: boldTextStyle(fontSize: 23.0, color: MyColor.green)),
    );
  }

  /// Image Widget
  Widget _buildImage(String path, {double height = 160}) {
    return Center(child: Image.asset(path, height: height));
  }

  /// Activity Box Widget
  Widget _buildActivityBox() {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.only(left: 15.0, right: 58),
          height: 90,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: MyColor.darkYellow,
              borderRadius: BorderRadius.circular(6)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Activity 2.3",
                  style: boldTextStyle(fontSize: 16.0, color: MyColor.black)),
              Text("Close your eyes and think about your favourite foods. What happens?",
                  style: boldTextStyle(fontSize: 14.0, color: MyColor.appTheme)),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(AssetsPath.foodChapter4Img1, height: 103),
        ),
      ],
    );
  }


  /// Image with Text Widget
  Widget _buildImageWithText(String imagePath, List<String> texts,
      {bool imageOnRight = true}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: imageOnRight
          ? [
        _buildTextColumn(texts),
        _buildImage(imagePath),
      ]
          : [
        _buildImage(imagePath),
        _buildTextColumn(texts),
      ],
    );
  }

  Widget _buildTextColumn(List<String> texts) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: texts
              .map((text) => Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(text,
                style: regularNormalTextStyle(
                    fontSize: 16.0, color: MyColor.black)),
          ))
              .toList(),
        ),
      ),
    );
  }

  /// Joke Section Widget
  Widget _buildJokeSection() {
    return Padding(
      padding: const EdgeInsets.only(top:20, bottom: 80,left:15),
      child: Stack(
        children: [
          _buildImage(AssetsPath.foodChapter4Img5,height:220),
          Container(
            width: 270,
            height: 100,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left:30.0,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Q. What time do you go to the dentist?",
                    style: semiBoldTextStyle(fontSize: 12.0, color: MyColor.pink)),
                hsized8,
                Text("A. At tooth-hurty! HE! HE!",
                    style: semiBoldTextStyle(fontSize: 12.0, color: MyColor.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




// import 'package:cooking_champs/constant/assets_path.dart';
// import 'package:cooking_champs/constant/my_color.dart';
// import 'package:cooking_champs/constant/my_fonts_style.dart';
// import 'package:cooking_champs/constant/sized_box.dart';
// import 'package:flutter/material.dart';
//
// class FoodChapter4View extends StatefulWidget {
//   const FoodChapter4View({super.key});
//
//   @override
//   State<FoodChapter4View> createState() => _FoodChapter4ViewState();
// }
//
// class _FoodChapter4ViewState extends State<FoodChapter4View> {
//   @override
//   Widget build(BuildContext context) {
//     var data = MediaQuery.of(context);
//     return  Scaffold(
//       backgroundColor: MyColor.white,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 50.0, bottom: 20,left:20,right: 20),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 InkWell(
//                   radius: 80,
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Icon(
//                     Icons.arrow_back_ios,
//                     size: 28,
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   "Food is energy",
//                   style: mediumTextStyle(
//                       fontSize: 18.0, color: MyColor.black),
//                 ),
//               ],
//             ),
//           ),
//
//           hsized10,
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.only(top: 10,bottom:10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left:20,right:20),
//                     child: Text("Digestion", textAlign: TextAlign.center,style:boldTextStyle(fontSize:25.0, color:MyColor.pink),),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left:20,right:20),
//                     child: Text("It all starts from the time you see and smell food and your mouth fills with saliva.",style:semiBoldTextStyle(fontSize:16.0, color:MyColor.sky),),
//                   ),
//
//
//                   hsized15,
//                   Stack(
//                     children: [
//                       Container(
//                         height: 90,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                               color: MyColor.darkYellow,
//                             borderRadius: BorderRadius.circular(6)
//                           ),
//                           margin: EdgeInsets.only(top:15,right: 20,left: 20),
//                           padding: const EdgeInsets.only(left:15.0,right:58),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Acitivity 2.3",style:boldTextStyle(fontSize:16.0, color:MyColor.black),),
//                               Text("Close your eyes and think about your favourite foods. What happens?",style:boldTextStyle(fontSize:14.0, color:MyColor.appTheme),),
//                             ],
//                           )),
//
//                       Align(
//                           alignment: Alignment.topRight,
//                           child: Image.asset(AssetsPath.foodChapter4Img1,height:103,width: 123,))
//                     ],
//                   ),
//
//                   hsized10,
//
//                   Image.asset(AssetsPath.foodChapter4Img2,),
//
//                   Padding(
//                     padding: EdgeInsets.only(left:20,right:20),
//                     child: Text("Teeth",style:boldTextStyle(fontSize:23.0, color:MyColor.green),),
//                   ),
//
//
//                   hsized10,
//                   Padding(
//                     padding: EdgeInsets.only(left:20,right:20),
//                     child: Text('Your teeth then get to do their important work of breaking down the food by chewing and crushing the food into small enough pieces for you to swallow.\n\nIt\'s very important to keep. your teeth hard and strong so they can do their job.',
//                     style:regularNormalTextStyle(fontSize:16.0, color:MyColor.black),),
//                   ),
//
//                   hsized20,
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Padding(
//                           padding: EdgeInsets.only(left:20,right:20),
//                           child: Column(
//                             children: [
//                               Text('If teeth are not brushed well they are covered by PLAQUE.',
//                                 style:regularNormalTextStyle(fontSize:16.0, color:MyColor.black),),
//                               hsized10,
//                               Text('Plaque is a sticky, colourless layer of bacteria and sugars that forms on our teeth.',
//                                 style:regularNormalTextStyle(fontSize:16.0, color:MyColor.black),),
//
//                               hsized10,
//                               Text('Plaque is the main cause of cavities and gum disease.',
//                                 style:regularNormalTextStyle(fontSize:16.0, color:MyColor.black),),
//                             ],
//                           ),
//                         ),
//                       ),
//
//                       Image.asset(AssetsPath.foodChapter4Img3,height:160,)
//                     ],
//                   ),
//
//                   hsized20,
//                   Row(
//                     children: [
//                       Image.asset(AssetsPath.foodChapter4Img4,height:160,),
//                       Expanded(
//                         child: Padding(
//                           padding: EdgeInsets.only(left:20,right:20),
//                           child: Column(
//                             children: [
//                               Text('Bacteria feed on the plaque and they release an acid that causes DECAY.',
//                                 style:regularNormalTextStyle(fontSize:16.0, color:MyColor.black),),
//                               hsized10,
//                               Text('If you don\'t take care of your teeth the decay makes your teeth rot and even fall out!',
//                                 style:regularNormalTextStyle(fontSize:16.0, color:MyColor.black),),
//                             ],
//                           ),
//
//
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   Container(
//                       height: 90,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           color: MyColor.darkYellow,
//                           borderRadius: BorderRadius.circular(6)
//                       ),
//                       margin: EdgeInsets.only(top:15,right: 20,left: 20),
//                       padding: const EdgeInsets.only(left:15.0,right:58),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Fun Fact",style:boldTextStyle(fontSize:18.0, color:MyColor.red1),),
//                           Text("An elephant’s tooth can weigh as much as three kilograms!! WOW!!",style:boldTextStyle(fontSize:15.0, color:MyColor.appTheme),),
//                         ],
//                       )),
//
//                   Padding(
//                     padding: const EdgeInsets.only(left:20.0,top: 30,bottom:80),
//                     child: Stack(
//                       children: [
//                         Image.asset(AssetsPath.foodChapter4Img5),
//
//                         Container(
//                           width:270,
//                          height: 100,
//                           alignment: Alignment.center,
//                           padding: EdgeInsets.only(left:20),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Q. What time do you go to the dentist?",style:semiBoldTextStyle(fontSize:12.0,color:MyColor.pink),),
//                               hsized8,
//                               Text("A. At tooth-hurty! HE! HE!",style:semiBoldTextStyle(fontSize:12.0,color:MyColor.white),),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   hsized45,
//
//                 ],
//               ),
//             ),
//           ),
//
//
//         ],
//       ),
//     );
//   }
// }
