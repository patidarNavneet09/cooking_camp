import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/model/post_model/otp_verify_request.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/all_dialogs.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/utils/utility.dart';
import 'package:cooking_champs/views/authentication/forgot_password_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:cooking_champs/widgets/otp_verify_success_popup.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:flutter/material.dart';

class OtpVerificationView extends StatefulWidget {
  final String? email;
  const OtpVerificationView({super.key, this.email});

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  final formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  String otpError = "";
  FocusNode otpFocus = FocusNode();

  @override
  void dispose() {
    otpFocus.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) => _showMaterialDialog,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leadingWidth: size.width * 0.08,
          leading: InkWell(
            radius: 50,
            onTap: () {
              //Navigator.pop(context);
              _showMaterialDialog();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: MyColor.black,
                size: 20,
              ),
            ),
          ),
          title:Text(
              "  ${Languages.of(context)!.verification}",
              style:mediumTextStyle(fontSize:18.0, color:MyColor.black)
          ),
          centerTitle: false,
        ),
        body: InkWell(
          onTap: (){
            setState(() {
              FocusManager.instance.primaryFocus!.unfocus();
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
      
                    Text(
                      Languages.of(context)!.enterOTPCode.toString(),
                      style:mediumTextStyle(fontSize:20.0, color:MyColor.black)
                    ),
      
                    SizedBox(
                      height: size.height * 0.01,
                    ),
      
                    Text(
                      "We have sent the code verification to your email ${widget.email}.",
                      style:regularTextStyle(fontSize:15.0, color:MyColor.black)
                    ),
      
                    SizedBox(
                      height: size.height * 0.04,
                    ),
      
                    Form(
                      key: formKey,
                      child: SizedBox(
                        width: size.width * 0.90,
                        // width: 300,
                        child: PinCodeTextField(
                          cursorColor: Colors.black,
                          cursorHeight: 17,
                          textStyle:mediumTextStyle(fontSize:18.0, color:MyColor.black),
                          autoFocus: false,
                          appContext: context,
                          length: 4,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            inactiveColor: MyColor.otpColor,
                            errorBorderColor: Colors.white,
                            disabledColor: MyColor.white,
                            activeColor: MyColor.appTheme,
                            selectedColor: MyColor.otpColor,
                            selectedFillColor: MyColor.liteYellowOtp,
                            inactiveFillColor: MyColor.liteYellowOtp,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(15),
                            fieldHeight: 70,
                            fieldWidth: 74,
                            activeFillColor: Colors.white,
                          ),
                          focusNode:otpFocus,
                          animationDuration: const Duration(milliseconds: 500),
                          enableActiveFill: true,
                          controller: otpController,
                          keyboardType: TextInputType.number,
                          onCompleted: (pin) {
                            setState(() {
                              otpController.text = pin;
                            });
                          },
                          onChanged: (pin2) {},
                          beforeTextPaste: (text) {
                            return true;
                          },
                        ),
                      ),
                    ),
      
                    UiUtils.errorText(otpError),
                  ],
                ),
      
                Padding(
                  padding: const EdgeInsets.only(bottom:20.0,left: 10,right: 10),
                  child: GlobalButton(Languages.of(context)!.submit.toString(), MyColor.appTheme, MyColor.appTheme, btnSize55,double.infinity, submitOnTap, 55, 5,0, mediumTextStyle(fontSize:16.0, color:MyColor.white)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submitOnTap() {
    FocusManager.instance.primaryFocus!.unfocus();
    debugPrint("otp....${otpController.text}");
    if(otpController.text.trim().isEmpty){
      setState(() {
        otpError = Languages.of(context)!.pleaseEnterOtp;
      });
    }else{
      setState(() {
        otpError = "";
      });
      otpVerify();
    }
  }

  otpVerify(){
    OtpRequestModel otpRequestModel = OtpRequestModel(otp:otpController.text);
    ApiServices.otpVerify(context,otpRequestModel).then((onValue){
      if(onValue.status == true){
        AllDialogs.customDialog(context,OtpVerifySuccessfullyPopup(email:widget.email.toString()));
      }else{
        Utility.customToast(context,onValue.message??"");
      }
    });
  }


  void _showMaterialDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title:  Text(
            'Are you sure exit page ?',
            style:semiBoldTextStyle(fontSize:20.0, color:MyColor.black)
          ),
          content:  Text(
            'Are you sure exit page if change email then click yes',
              style:semiBoldTextStyle(fontSize:15.0, color:MyColor.black)
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'No',
                style: TextStyle(
                  color: Color(0xfff51957),
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                ),
              ),
            ),
            
            TextButton(
              onPressed: () {
                CustomNavigators.pushRemoveUntil(ForgotPasswordView(), context);
              },
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: Color(0xfff51957),
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
}
}
