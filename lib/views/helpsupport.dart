import 'dart:io';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/model/dynamic_models/help_and_support_model.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/utility.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class HelpSupportView extends StatefulWidget {
  const HelpSupportView({super.key});

  @override
  State<HelpSupportView> createState() => _HelpSupportViewState();
}

class _HelpSupportViewState extends State<HelpSupportView> {
  List<HelpAndSupportModel> helpAndSupportList =[];

  @override
  void initState() {
    Future.delayed(Duration.zero,helpAndSupport);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context);
    return MediaQuery(
      data: size.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 0, automaticallyImplyLeading: false,
          backgroundColor: MyColor.yellowF6F1E1,
          surfaceTintColor: MyColor.yellowF6F1E1,
          title: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TouchRippleEffect(
                 borderRadius: BorderRadius.circular(30),
                  rippleColor: Colors.white,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.black,
                  ),
                ),

                Text(
                  Languages.of(context)!.helpSupport,
                  style:mediumTextStyle(fontSize:18.0, color:MyColor.black)
                ),
              ],
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal:10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                helpAndSupportList.isEmpty?SizedBox.shrink():
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:helpAndSupportList.length,
                    itemBuilder: (context,int index){
                return  Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                              helpAndSupportList[index].title??"",
                              style:mediumTextStyle(fontSize:16.0, color:MyColor.black)
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              Utility.removeHtmlTag(helpAndSupportList[index].description??""),
                                style:mediumTextStyle(fontSize:13.0, color:MyColor.black)
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),

                hsized30

              ],
            ),
          ),
        ),
      ),
    );
  }

  helpAndSupport()async{
    await ApiServices.getHelpAndSupport(context, true).then((onValue){
      if(mounted){
        setState(() {
          if(onValue.status == true){
            if(onValue.data != null) {
              for(var help in onValue.data){
                HelpAndSupportModel model = HelpAndSupportModel.fromJson(help);
                helpAndSupportList.add(model);
              }

            }
          }
        });
      }
    });
  }
}
