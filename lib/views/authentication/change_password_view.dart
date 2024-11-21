import 'dart:io';
import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/model/post_model/change_pass_model.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/all_dialogs.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/utils/utility.dart';
import 'package:cooking_champs/views/dashboard.dart';
import 'package:cooking_champs/widgets/change_password_popup.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPassController = TextEditingController();

  dynamic isFocusColor = '';

  String newPassError = "";
  String newConPassError = "";



  bool isPassHide = true;
  bool isConPassHide = true;
  bool isValidate = false;

  String passwordImage = AssetsPath.hideEyeIc;
  String conPasswordImage = AssetsPath.hideEyeIc;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        automaticallyImplyLeading: false,
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
                Languages.of(context)!.changePassword,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: Fonts.beVietnamProRegular,
                  color: MyColor.black,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    hsized10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                                Languages.of(context)!.newPassword.toString(),
                                style: regularTextStyle(fontSize: 15.0, color:MyColor.black)
                            ),
                            Text(
                                " *",
                                style: regularTextStyle(fontSize: 15.0, color:MyColor.red)
                            ),
                          ],
                        ),
                        UiUtils.errorText(newPassError)
                      ],
                    ),


                    SizedBox(
                      height: size.height * 0.01,
                    ),


                    commonTextField(newPasswordController, Languages.of(context)!.enterpassword.toString(),TextInputAction.done,TextInputType.text,"Password",isPassHide),


                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              Languages.of(context)!.confirmnewPassword.toString(),
                              style:regularTextStyle(fontSize: 15.0, color:MyColor.black)
                            ),
                             Text(
                              " *",
                              style:regularTextStyle(fontSize: 15.0, color:MyColor.red)
                            ),
                          ],
                        ),

                        UiUtils.errorText(newConPassError)
                      ],
                    ),

                    SizedBox(
                      height: size.height * 0.01,
                    ),

                    commonTextField(confirmNewPassController, Languages.of(context)!.enterpassword.toString(),TextInputAction.done,TextInputType.text,"Con Password",isConPassHide),

                  ],
                ),
              ),
            ],
          ),


          Container(
            margin: const EdgeInsets.only(bottom: 30,right: 20,left: 20),
            child: GlobalButton(Languages.of(context)!.savePassword.toString(), MyColor.appTheme, MyColor.appTheme, btnSize55,double.infinity, checkValidation,55,5,0,mediumTextStyle(fontSize:16.0, color:MyColor.white))

          ),
        ],
      ),
    );
  }
  /// Password hide show..................
  void hideShowPass() {
    isPassHide = !isPassHide;
    if (isPassHide) {
      passwordImage = AssetsPath.eyeIc;
    } else {
      passwordImage = AssetsPath.hideEyeIc;
    }
    setState(() {});
  }

  /// Password hide show..................
  void hideShowConfPass() {
    isConPassHide = !isConPassHide;
    if (isConPassHide) {
      conPasswordImage = AssetsPath.eyeIc;
    } else {
      conPasswordImage = AssetsPath.hideEyeIc;
    }
    setState(() {});
  }

  /// set Suffix icon............
  suffixIconSet(String type) {
    return Padding(
      padding: const EdgeInsets.only(top:4, bottom:4, left:7, right:7),
      child:type == "Password" || type == "Con Password"  ? GestureDetector(
          onTap: type == "Password" ? hideShowPass:hideShowConfPass,
          child: SvgPicture.asset(
            type == "Password" ?  passwordImage : conPasswordImage,
          ))
          : const SizedBox(height: 10, width: 10),
    );
  }


  commonTextField(
      TextEditingController controller,
      String labelText,
      TextInputAction textInputAction,
      TextInputType textInputType,
      String type,
      bool hidePass
      ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: isFocusColor == type
                ? MyColor.liteOrange
                : MyColor.grayLite),
        color: MyColor.white,
        borderRadius:
        const BorderRadius.all(Radius.circular(12)),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(12, 5, 0, 15),
      height: 55,
      child: TextField(
        obscureText: type == "Password" ||  type == "Con Password" ? hidePass : false,
        textCapitalization: TextCapitalization.sentences,
        onTap: (){
          if(mounted) {
            setState(() {
              isFocusColor = type;
            });
          }
        },
        buildCounter: (BuildContext context,
            {required int currentLength,
              int? maxLength,
              required bool isFocused}) =>
        null,
        controller: controller,
        onTapOutside: (v){
          FocusManager.instance.primaryFocus!.unfocus();
        },
        textInputAction: TextInputAction.next,
        style:regularTextStyle(fontSize:14.0, color:MyColor.black),
        decoration: InputDecoration(
          suffixIcon: suffixIconSet(type ),
          border: InputBorder.none,
          hintText: labelText,
          hintStyle:regularTextStyle(fontSize:14.0, color:MyColor.grayLite1),
          counter: const Offstage(),
          isDense: true,
          // this will remove the default content padding
          contentPadding: const EdgeInsets.only(
            top: 10,
          ),
        ),
        maxLines: 1,
        cursorColor: MyColor.black,
      ),
    );
  }

  checkValidation(){
    if(newPasswordController.text.trim().isEmpty){
      newPassError = Languages.of(context)!.atleast5;
    }else if(confirmNewPassController.text.trim().isEmpty){
      newConPassError = Languages.of(context)!.atleast5;
    }else if(confirmNewPassController.text != newPasswordController.text){
      newConPassError = Languages.of(context)!.newConPAssNotMatch;
    }else{
      newConPassError ="";
      newPassError ="";
      Future.delayed(Duration.zero, changePassword);
    }
  }

  changePassword()async{
    ChangePasswordModel changePasswordModel = ChangePasswordModel(
      newPassword: newPasswordController.text,
      newPasswordConfirmation: confirmNewPassController.text
    );
    await ApiServices.changePassword(context, changePasswordModel).then((onValue){
      if(onValue.status == true){
        Utility.customToast(context, onValue.message??"");
        AllDialogs.customDialog(context, ChangePasswordPopup(title: Languages.of(context)!.passwordchanged,
          des:Languages.of(context)!.yourpasswordhasbeensuccessfullyreset,
          img:AssetsPath.passwordChangeImg, btnName:Languages.of(context)!.gotoHome.toString(),
          onTap: () {
          CustomNavigators.pushRemoveUntil(DashBoardView(pageIndex: 0,), context);
          },));
      }
    });
  }

}
