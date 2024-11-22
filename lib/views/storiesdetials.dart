import 'dart:io';

import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/model/dynamic_models/my_story_model.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/all_dialogs.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/story/share_story_view.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class StoriesDetailsView extends StatefulWidget {
   StoryModel model;
   StoriesDetailsView({super.key,required this.model});

  @override
  State<StoriesDetailsView> createState() => _StoriesDetailsViewState();
}

class _StoriesDetailsViewState extends State<StoriesDetailsView> {
  List<StoryImages> storyImagesList = [];
  StoryImages storyImageModel = StoryImages();
  StoryModel storyModel = StoryModel();
  int currentIndex = 0;

  @override
  void initState() {
    setStoryImage();
  //  Future.delayed(Duration.zero,getStoriesDetail);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
             /*   Container(
                  width: size.width,
                  height: size.height * 0.35,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  child:UiUtils.networkImages(double.infinity,size.height*0.35,widget.model.image != null?ApiPath.imageBaseUrl+widget.model.image.toString():"" )
                ),*/

                SizedBox(
                  width: size.width,
                  height: size.height * 0.35,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      PageView.builder(
                        itemCount:storyImagesList.length ,
                          onPageChanged: (v){
                          if(mounted){
                            setState(() {
                              currentIndex = v;
                            });
                          }
                          },
                          itemBuilder: (context,int index){
                        return  Container(
                            width: size.width,
                            height: size.height * 0.35,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                            child:UiUtils.networkImages(double.infinity,size.height*0.35,storyImagesList[index].images != null?ApiPath.imageBaseUrl+storyImagesList[index].images.toString():"" )
                        );
                      }),

                      Container(
                        padding: EdgeInsets.only(bottom: 20),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children:List.generate(storyImagesList.length,(index){
                              return Container(
                                margin: EdgeInsets.only(right: 5),
                                height:8,
                                width: currentIndex == index?18:8,
                                decoration: BoxDecoration(
                                  color:currentIndex == index?MyColor.blue1:MyColor.liteGray,
                                  borderRadius: BorderRadius.circular(100),
                                 // shape: BoxShape.circle
                                ),
                              );
                            }),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 15),
                  child: InkWell(
                    radius: 80,
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0,top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.title??"",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: Fonts.beVietnamProRegular,
                      color: MyColor.black,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.model.description??"",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      fontFamily: Fonts.beVietnamProRegular,
                      color: MyColor.black,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap:(){
          AllDialogs.globalBottomSheet(context, ShareStoryView(),(){});
        },
        child: Container(
          height:Platform.isAndroid? 70:80,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: MyColor.appTheme
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.share_outlined,color: Colors.white,),
              SizedBox(width: 12,),
              Text("Share",style: mediumTextStyle(fontSize:18.0, color:MyColor.white),),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getStoriesDetail() async {
    try {
    await ApiServices.getStoryDetail(context, true,widget.model.id.toString()).then((onValue){
        if (mounted && onValue.status == true) {
          setState(() {
            if ( onValue.data != null) {
              storyModel = StoryModel.fromJson(onValue.data);
              widget.model = storyModel;
             setStoryImage();
            }
          });

        }
      });

    } catch (e) {
      debugPrint('Error fetching stories: $e');
    }
  }

  void setStoryImage() {
    if(mounted){
      setState(() {
        if(widget.model.image != null){
          storyImageModel = StoryImages(id:"0",storyId: widget.model.id,images:widget.model.image,createdAt:widget.model.createdAt,updatedAt: widget.model.updatedAt );
          storyImagesList.add(storyImageModel);
        }
        if(widget.model.storyImages != null){
          //storyImageModel = StoryImages.fromJson(json)
          storyImagesList.addAll(widget.model.storyImages!);
        }
      });
    }

  }
}