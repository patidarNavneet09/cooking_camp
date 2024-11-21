import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShareStoryView extends StatefulWidget {
  const ShareStoryView({super.key});

  @override
  State<ShareStoryView> createState() => _ShareStoryViewState();
}

class _ShareStoryViewState extends State<ShareStoryView> {
  bool isCheck = false;
  int id = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: IntrinsicHeight(
          child:Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: MyColor.white,
                borderRadius: BorderRadius.only(topLeft:Radius.circular(15),topRight:Radius.circular(15))
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top:10,bottom: 10),
                        width: 120,
                        height:5,
                        decoration: BoxDecoration(
                          color: MyColor.liteGray,
                          borderRadius:BorderRadius.circular(5)
                        ),
                      ),
                    ),
                
                    Text(Languages.of(context)!.share,style: mediumTextStyle(fontSize:20.0, color:MyColor.black),),
                
                    Container(
                      padding: EdgeInsets.only(top:10),
                      child:UiUtils.dividerLine() ,
                    ),
                
                    Container(
                      alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top:10,left: 20),
                        child: Text(Languages.of(context)!.tapToSelectAndShare,style: regularTextStyle(fontSize:15.0, color:MyColor.black),)),
                
                    hsized10,
                
                    Column(
                      children:List.generate(10, (int index){
                        return friendsCard(index);
                      }),
                    ),

                    hsized50,

                  ],
                ),
              ),
            ),

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:  Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        alignment: Alignment.bottomCenter,
        child: GlobalButton("Share Now",MyColor.appTheme,MyColor.appTheme,btnSize55,double.infinity,shareOnTap,55,5,0,mediumTextStyle(fontSize:16.0, color:MyColor.white)),
      ),
    );
  }
  friendsCard(int index){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical:8),
          padding: EdgeInsets.symmetric(horizontal:10,vertical:8),
          decoration: BoxDecoration(
            color: MyColor.white,
            border: Border.all(color: MyColor.appTheme,width: 1),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.lightBlue,
                radius:30,
              ),
              SizedBox(width: 10),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                Text("Andrew Robert",style: mediumTextStyle(fontSize:16.0, color:MyColor.black),),
                Text("12 | March | 2006 | 1 st Standard",style:regularTextStyle(fontSize:14.0, color:MyColor.black),),
              ],
                  )),

              InkWell(
                onTap: (){
                  setState(() {
                    isCheck = !isCheck;
                    id = index;
                  });
                },
                child: SvgPicture.asset(id == index &&isCheck?AssetsPath.fillCheck:AssetsPath.check),
              )
            ],
          ),
        ),

        index == 9 ? hsized100:SizedBox.shrink()
      ],
    );
  }

  void shareOnTap() {
  }
}
