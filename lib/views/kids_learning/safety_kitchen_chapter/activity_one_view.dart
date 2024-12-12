import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/kids_learning/safety_kitchen_chapter/activity_two_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class ActivityOneView extends StatefulWidget {
  const ActivityOneView({super.key});

  @override
  State<ActivityOneView> createState() => _ActivityOneViewState();
}

class _ActivityOneViewState extends State<ActivityOneView> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return MediaQuery(
        data: data.copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize:Size.zero,
            child: AppBar(
              backgroundColor:MyColor.white,
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left:15,right:15,top:0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            CustomNavigators.popNavigate(context);
                          },
                          child: Icon(Icons.arrow_back_ios,color: MyColor.black,size:28,),
                        ),
                        Text("${Languages.of(context)!.activity}1.1",style:mediumTextStyle(fontSize:18.0, color:MyColor.black),)
                      ],
                    ),

                    UiUtils.bookReadGirl(MyColor.darkOrange,AssetsPath.bookReadImg)

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left:15.0,right:15),
                child: Text("Look at the picture below.",style:boldTextStyle(fontSize:23.0, color:MyColor.darkOrange),),
              ),
              hsized10,
              Padding(
                padding: const EdgeInsets.only(left:15.0,right: 5),
                child: Image.asset(AssetsPath.activityImg1),
              ),
              Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(20,0,20,30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    hsized10,
                     Text("List the risks",style:semiBoldTextStyle(fontSize:18.0, color:MyColor.black),),
                     Text("Draw a circle around the things that look risky in this kitchen.",style:regularNormalTextStyle(fontSize:15.0, color:MyColor.black),),
                    textField(),

                     Text("Why are these areas or things risky?",style:regularNormalTextStyle(fontSize:15.0, color:MyColor.black),),

                    textField(),

                     Text("How do you make this kitchen safer?",style:regularNormalTextStyle(fontSize:15.0, color:MyColor.black),),
                    textField(),
                    hsized30,
                  ],
                ),
              )),

              hsized30
            ],
          ),
          bottomSheet:  Container(
              color: MyColor.white,
              padding: EdgeInsets.only(left:20,right:20,bottom:20,top:0),
              child:GlobalButton(Languages.of(context)!.submit,MyColor.appTheme,MyColor.appTheme, 55,double.infinity,submitOnTap,55,0,0,mediumTextStyle(fontSize:16.0, color:MyColor.white))
          ),
        )
    );
  }

  void submitOnTap() {
    CustomNavigators.pushNavigate(ActivityTwoView(), context);
  }

  textField(){
    return Stack(
      children: [
        for (int i = 0; i < 2; i++)
          Container(
            margin: EdgeInsets.only(
              top: 4 + (i + 1) * 28,
            ),
            decoration: const BoxDecoration(
              border: DashedBorder(
                dashLength: 5,
                left: BorderSide.none,
                top: BorderSide.none,
                right: BorderSide.none,
                bottom: BorderSide(color: Colors.black, width: 1),
              ),
            ),
          ),
        SizedBox(
          height: 97,
          child: TextField(
            scrollPhysics: NeverScrollableScrollPhysics(),
            decoration: InputDecoration(border: InputBorder.none),
            cursorHeight: 22,
            onTapOutside: (v){
              FocusManager.instance.primaryFocus!.unfocus();
            },
            style: TextStyle(
              fontSize: 20.0,
            ),
            keyboardType: TextInputType.multiline,
            expands: true,
            maxLines: null,
          ),
        ),
      ],
    );
  }
}
