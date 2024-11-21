import 'package:cooking_champs/constant/app_state.dart';
import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/model/post_model/login_request_model.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/services/user_prefences.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/views/authentication/login_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constant/my_color.dart';

class DeleteKidPopup extends StatefulWidget {
  Function? onCallBack;
   DeleteKidPopup({super.key,this.onCallBack});

  @override
  State<DeleteKidPopup> createState() => _DeleteKidPopupState();
}

class _DeleteKidPopupState extends State<DeleteKidPopup> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final size = data.size;
    return MediaQuery(
        data: data.copyWith(textScaleFactor: 1.0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,

          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20,10,20,25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Wrap(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15,top: 10),
                        alignment: Alignment.center,
                        height: 60,
                        width:60,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: MyColor.red,
                          shape: BoxShape.circle
                        ),
                        child: SvgPicture.asset(
                          AssetsPath.deleteIc,
                          height: MediaQuery.of(context)
                              .size
                              .height *
                              0.17,
                          width: MediaQuery.of(context)
                              .size
                              .width,
                        ),
                      ),
                    ),

                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom:5.0),
                      child: Text(
                          Languages.of(context)!.deleteKid,
                          textAlign: TextAlign.center,
                          style:mediumTextStyle(fontSize:20.0, color: MyColor.black)
                      ),
                    ),

                    Container(
                        alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom:25.0),
                      child: Text(
                          Languages.of(context)!.areYouSureDeleteKidProfile,
                          textAlign: TextAlign.center,
                          style: regularTextStyle(fontSize:15.0, color: MyColor.black)
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom:10.0,top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              flex: 1,
                              child: GlobalButton(
                                  Languages.of(context)!.yes.toString(),
                                  MyColor.white,
                                  MyColor.red,
                                  btnSize55,
                                  double.infinity,
                                  yesOnTap,
                                  34,
                                  5,
                                  1.7,
                                  mediumTextStyle(
                                      fontSize: 16.0, color: MyColor.appTheme))),

                          SizedBox(width: 10),

                          Expanded(
                              flex: 1,
                              child: GlobalButton(
                                  Languages.of(context)!.no.toString(),
                                  MyColor.red,
                                  MyColor.red,
                                  btnSize55,
                                  double.infinity,
                                  noOnTap,
                                  34,
                                  6,
                                  0,
                                  mediumTextStyle(
                                      fontSize: 16.0, color: MyColor.white))),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void yesOnTap() async{
    Navigator.pop(context);
    if(widget.onCallBack != null) {
      widget.onCallBack!();
    }
  }


  void noOnTap() {
    CustomNavigators.popNavigate(context);
  }

}
