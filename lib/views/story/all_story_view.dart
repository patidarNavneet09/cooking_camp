import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/model/dynamic_models/my_story_model.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/views/story/storie_detials.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class AllStoryView extends StatefulWidget {
  const AllStoryView({super.key});

  @override
  State<AllStoryView> createState() => _AllStoryViewState();
}

class _AllStoryViewState extends State<AllStoryView> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    var size = data.size;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:MyColor.colorFFFED6,
        // leadingWidth: 0.08,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left:20.0),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        title: Text(Languages.of(context)!.memories,style:mediumTextStyle(fontSize:18.0, color:MyColor.black),),
        centerTitle: false,
      ),
      body:  ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  left:20, right:20, bottom: 5, top: 10),
              child: TouchRippleEffect(
                borderRadius: BorderRadius.circular(10),
                rippleColor: Colors.white,
                onTap: () {
                  CustomNavigators.pushNavigate(StoriesDetailsView(model:StoryModel()), context);
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: MyColor.white,
                      borderRadius:
                      BorderRadius.all(Radius.circular(10))),
                  width: size.width,
                 // height: 250,
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                          width: size.width,
                          height: 160,
                          AssetsPath.demo1,fit: BoxFit.cover,),
                      hsized10,

                      Text(
                          "Lorem Ipsum ",
                          style:mediumTextStyle(fontSize:15.0, color:MyColor.black)
                      ),

                      hsized10,
                      Text(
                          "Lorem Ipsum is simply dummy text of the and typesetting.. ",
                          style:regularTextStyle(fontSize: 11.0, color:MyColor.black)
                      ),

                      hsized10,
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
