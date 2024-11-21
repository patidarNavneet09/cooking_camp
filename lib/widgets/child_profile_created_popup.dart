import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/views/my_kids_listing_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ChildProfileCreatedPopup extends StatefulWidget {
  final String name;
 final bool check;
final Function?onCallBack;
final String title;
final String des;
  const ChildProfileCreatedPopup({super.key,required this.name,required this.check,this.onCallBack,required this.title,required this.des});

  @override
  State<ChildProfileCreatedPopup> createState() => _ChildProfileCreatedPopupState();
}

class _ChildProfileCreatedPopupState extends State<ChildProfileCreatedPopup> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final size = data.size;
    return  MediaQuery(data: data,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              padding: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      child: Lottie.asset(
                        AssetsPath.cookingChamp,
                        height: MediaQuery.of(context).size.height * 0.17,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),

                    Text(widget.title,
                      style:mediumTextStyle(fontSize:20.0, color:MyColor.black)
                    ),

                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      widget.des,
                      textAlign: TextAlign.center,
                      style:regularNormalTextStyle(fontSize:15.0, color:MyColor.black)
                    ),

                    SizedBox(
                      height: size.height * 0.03,
                    ),

                    GlobalButton(Languages.of(context)!.okay.toString(), MyColor.appTheme, MyColor.appTheme,btnSize55,size.width, okOnTap,55,5,0,mediumTextStyle(fontSize:16.0, color:MyColor.white)),

                   /* SizedBox(
                      width: size.width * 0.95,
                      height: 55,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColor.appTheme,
                            overlayColor: MyColor.liteOrange,
                            enableFeedback: true,
                            enabledMouseCursor: MouseCursor.defer,
                            elevation: 5,
                            // Optional: elevation (shadow)
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(34), // Custom shape
                            ),
                          ),
                          onPressed: () {

                          },
                          child: Text(
                            Languages.of(context)!.okay.toString(),
                            style:mediumTextStyle(fontSize:16.0, color:MyColor.white)
                          )),
                    ),*/

                    hsized30,
                  ],
                ),
              ),
            ],
          )
        ));
  }

  void okOnTap() {
    if (widget.check == true) {
      Navigator.pop(context);
      if(widget.onCallBack != null) {
        widget.onCallBack!();
      }
    } else {
      CustomNavigators.pushNavigate(MyKidsListingView(pageType: 'Register',), context);
    }
  }
}
