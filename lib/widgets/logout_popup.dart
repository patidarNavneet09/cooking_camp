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
import 'package:cooking_champs/views/dashboard.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constant/my_color.dart';

class LogoutPopup extends StatefulWidget {
  const LogoutPopup({super.key});

  @override
  State<LogoutPopup> createState() => _LogoutPopupState();
}

class _LogoutPopupState extends State<LogoutPopup> {
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
                child: Column(
                  children: [
                    Lottie.asset(
                      AssetsPath.logoutCookie,
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Text(Languages.of(context)!.logoutAccount,
                        style: mediumTextStyle(fontSize: 20.0, color: MyColor.black)),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(Languages.of(context)!.areyousureyouwanttologoutyouraccount,
                        textAlign: TextAlign.center,
                        style: regularNormalTextStyleWithoutHeight(
                            fontSize: 15.0, color: MyColor.black)),

                    SizedBox(
                      height: size.height * 0.03,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            flex: 1,
                            child: GlobalButton(
                                Languages.of(context)!.yes.toString(),
                                MyColor.white,
                                MyColor.appTheme,
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
                                MyColor.appTheme,
                                MyColor.appTheme,
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
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void yesOnTap() async{
    LoginRequestModel loginRequestModel = LoginRequestModel(
        deviceId:AppState.deviceIdStr
    );
    Future.delayed(Duration.zero,() async{
      await  ApiServices.logoutRequest(context, loginRequestModel).then((onValue){
        if(mounted){
          setState(() {
            if(onValue.status == true){
              tabCheck = "";
            PreferencesServices.setLogoutPreferencesData();
              CustomNavigators.pushRemoveUntil(LoginView(), context);
            }
          });
        }
      });
    });
  }


  void noOnTap() {
    CustomNavigators.popNavigate(context);
  }

}
