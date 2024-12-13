import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class BasicChapter3View extends StatefulWidget {
 final String image;
 final double height;
  const BasicChapter3View({super.key,required this.image,required this.height});

  @override
  State<BasicChapter3View> createState() => _BasicChapter3ViewState();
}

class _BasicChapter3ViewState extends State<BasicChapter3View> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:50.0,left:20,right: 20,bottom: 20),
            child:UiUtils.hygieneAppBar(()=> Navigator.pop(context),text: "The Basic",color: MyColor.black),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(widget.image,height:widget.height,width:double.infinity,),
            
                    hsized100
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
