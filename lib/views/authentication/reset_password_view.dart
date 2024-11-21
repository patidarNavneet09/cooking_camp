import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/model/post_model/reset_pass_request.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/all_dialogs.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/utils/utility.dart';
import 'package:cooking_champs/views/authentication/login_view.dart';
import 'package:cooking_champs/widgets/change_password_popup.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatefulWidget {
  final String? email;
  const ResetPasswordView({super.key, this.email});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  
  final formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  dynamic isFocusColor = '';
  bool isPassHide = true;
  bool isConPassHide = true;
  bool isValidate = false;
  String newPassError = "";
  String newConPassError = "";
  String passwordImage = AssetsPath.hideEyeIc;
  String conPasswordImage = AssetsPath.hideEyeIc;
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: size.width * 0.09,
        leading: InkWell(
          radius: 50,
          onTap: () {
            Navigator.pop(context);
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.only(left:20),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: MyColor.black,
              size: 20,
            ),
          ),
        ),
        title:    Text(
          Languages.of(context)!.resetPassword,
          style: mediumTextStyle(fontSize:18.0, color:MyColor.black)
        ),
        centerTitle:  false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hsized20,
                  titleText( Languages.of(context)!.newPassword.toString(),newPassError),

                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  commonTextField(passwordController, Languages.of(context)!.enterpassword.toString(),TextInputAction.done,TextInputType.text,"Password",isPassHide),


                  /*Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: _isFocusColor == "enterpassword"
                              ? MyColor.liteYellow
                              : MyColor.grayLite),
                      color: MyColor.white,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(12, 5, 0, 15),
                    height: 55,
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      onTap: () {
                        _isFocusColor = "enterpassword";
                      },
                      // textInputAction: TextInputAction.next,
                      onEditingComplete: () {
                        // String input = phoneController.text;
                        // if (input.isNotEmpty && input.length == 10) {
                        //   loginApi(context, input, countrycode, devicetype,
                        //       devicetoken);
                        // }
                      },

                      buildCounter: (BuildContext context,
                              {required int currentLength,
                              int? maxLength,
                              required bool isFocused}) =>
                          null,
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      // ],
                      controller: passwordController,

                      textInputAction: TextInputAction.next,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: Fonts.beVietnamProRegular,
                        color: MyColor.black,
                      ),
                      // obscureText: _obscureTextpassword,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: Languages.of(context)!.enterpassword.toString(),
                        // suffixIcon: Padding(
                        //   padding: const EdgeInsets.only(bottom: 2),
                        //   child: IconButton(
                        //     icon: Icon(
                        //       _obscureTextpassword
                        //           ? Icons.visibility_off
                        //           : Icons.visibility,
                        //       color: MyColor.grayeye,
                        //       size: 25,
                        //     ),
                        //     onPressed: () {
                        //       setState(() {
                        //         _obscureTextpassword = !_obscureTextpassword;
                        //       });
                        //     },
                        //   ),
                        // ),
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: MyColor.grayLite1,
                          fontFamily: Fonts.beVietnamProRegular,
                        ),
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
                  ),*/

                  SizedBox(
                    height: size.height * 0.03,
                  ),

        titleText( Languages.of(context)!.confirmnewPassword.toString(),newConPassError),

                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  commonTextField(confirmPassController, Languages.of(context)!.enterpassword.toString(),TextInputAction.done,TextInputType.text,"Con Password",isConPassHide),

                ],
              ),
            ),
           /* Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: size.width * 0.95,
                  height: 55,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColor.appTheme,
                        // surfaceTintColor: MyColor.white,
                        overlayColor: MyColor.liteYellow,
                        enableFeedback: true,

                        enabledMouseCursor: MouseCursor.defer,
                        // Background color
                        // Text color (alternative)
                        elevation: 5, // Optional: elevation (shadow)
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10), // Custom padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(34), // Custom shape
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(25.0))),
                                content: Builder(builder: (context) {
                                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                  var size = MediaQuery.of(context).size;

                                  return SizedBox(
                                    height: size.height * 0.38,
                                    width: size.width * 0.90,
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Lottie.asset(
                                            'assets/images/PasswordChangeCooking.json',
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.17,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                        ),
                                        Text(
                                          Languages.of(context)!.passwordchanged,
                                          style: const TextStyle(
                                            color: MyColor.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            fontFamily: Fonts.beVietnamProRegular,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Text(
                                          Languages.of(context)!.yourpasswordhasbeensuccessfullyreset,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: MyColor.black,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 15,
                                            fontFamily: Fonts.beVietnamProRegular,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.03,
                                        ),
                                        SizedBox(
                                          width: size.width * 0.95,
                                          height: 55,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: MyColor.appTheme,
                                                // surfaceTintColor: MyColor.white,
                                                overlayColor:
                                                    MyColor.liteYellow,
                                                enableFeedback: true,

                                                enabledMouseCursor:
                                                    MouseCursor.defer,
                                                // Background color
                                                // Text color (alternative)
                                                elevation:
                                                    5, // Optional: elevation (shadow)
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 20,
                                                    vertical:
                                                        10), // Custom padding
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          34), // Custom shape
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const LoginView()),
                                                        (Route<dynamic>
                                                                route) =>
                                                            false);
                                              },
                                              child: Text(
                                                Languages.of(context)!.gotoLogin.toString(),
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: Fonts.beVietnamProRegular,
                                                  color: MyColor.white,
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  );
                                })));
                      },
                      child: Text(
                        Languages.of(context)!.submit.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: Fonts.beVietnamProRegular,
                          color: MyColor.white,
                        ),
                      )),
                ),
              ],
            ),*/

            Padding(
              padding: const EdgeInsets.only(bottom:30.0,left: 10,right: 10),
              child: GlobalButton(Languages.of(context)!.submit.toString(), MyColor.appTheme, MyColor.appTheme, btnSize55,double.infinity, submitOnTap, 55, 5,0, mediumTextStyle(fontSize:16.0, color:MyColor.white)),
            )
          ],
        ),
      ),
    );
  }

  titleText(String title,String error){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              Languages.of(context)!.newPassword.toString(),
              style:regularTextStyle(fontSize:15.0, color:MyColor.black)
            ),

             Text(
              " *",
              style: regularTextStyle(fontSize:15.0, color:MyColor.red)
            ),
          ],
        ),

        UiUtils.errorText(error)
      ],
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


  void submitOnTap(){
    setState(() {
      isValidate = true;
      if(passwordController.text.trim().isEmpty){
        isValidate = false;
        newPassError = Languages.of(context)!.atleast5;
      } if(confirmPassController.text.trim().isEmpty){
        isValidate = false;
        newConPassError = Languages.of(context)!.atleast5;
      }
      if(confirmPassController.text != passwordController.text){
        isValidate = false;
        newConPassError = Languages.of(context)!.newConPAssNotMatch;
      }else{
        newConPassError ="";
        newPassError ="";
      }
    });


    if(isValidate) {
      Future.delayed(Duration.zero, resetPassword);
    }

  }

  resetPassword()async{
    ResetPasswordRequest resetPasswordRequest = ResetPasswordRequest(
        email:widget.email ,
        newPassword: passwordController.text,
        newPasswordConfirmation:confirmPassController.text
    );
    await ApiServices.resetPassword(context, resetPasswordRequest).then((onValue){
      if(onValue.status == true){
        Utility.customToast(context, onValue.message??"");
        AllDialogs.customDialog(context, ChangePasswordPopup(title: Languages.of(context)!.passwordchanged,
          des:Languages.of(context)!.yourpasswordhasbeensuccessfullyreset,
          img:AssetsPath.passwordChangeImg, btnName:Languages.of(context)!.gotoLogin.toString(),
          onTap: () {
            CustomNavigators.pushRemoveUntil(LoginView(), context);
          },));
      }
    });
  }
}
