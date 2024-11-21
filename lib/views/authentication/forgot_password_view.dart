import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/authentication/forgot_password_confirmation_view.dart';
import 'package:cooking_champs/views/authentication/login_view.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController emailController = TextEditingController();
  dynamic isFocusColor = '';
  String emailError = "";


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        leadingWidth: size.width * 0.08,
        leading: InkWell(
          onTap: () {
            CustomNavigators.pushRemoveUntil(LoginView(), context);
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
        title:  Text(
            "  ${Languages.of(context)!.forgotPassword}",
            style:mediumTextStyle(fontSize:18.0, color:MyColor.black)
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              hsized10,
              Text(
                Languages.of(context)!.dontworryEnteryouremail,
                style:mediumTextStyle(fontSize:24.0, color:MyColor.black)
              ),

              hsized30,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Languages.of(context)!.email.toString(),
                    style:regularTextStyle(fontSize:15.0, color:MyColor.black)
                  ),

                  UiUtils.errorText(emailError)
                ],
              ),

              SizedBox(
                height: size.height * 0.02,
              ),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: isFocusColor == "firstName"
                          ? MyColor.liteOrange
                          : MyColor.grayLite),
                  color: MyColor.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(12, 5, 0, 15),
                height: 55,
                child: TextField(
                  onTap: () {
                    isFocusColor = "firstName";
                  },
                  buildCounter: (BuildContext context, {required int currentLength, int? maxLength, required bool isFocused}) => null,
                  controller: emailController,
                  textInputAction: TextInputAction.done,
                  style: regularTextStyle(fontSize:14.0, color:MyColor.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: Languages.of(context)!.enterEmail.toString(),
                    hintStyle:regularTextStyle(fontSize:14.0, color:MyColor.grayLite1),
                    counter: const Offstage(),
                    isDense: true,
                    contentPadding: const EdgeInsets.only(
                      top: 10,
                    ),
                  ),
                  maxLines: 1,
                  cursorColor: MyColor.black,
                ),
              ),

              SizedBox(
                height: size.height * 0.10,
              ),

              GlobalButton(Languages.of(context)!.continuee.toString(), MyColor.appTheme, MyColor.appTheme, btnSize55,double.infinity, continueOnTap, 55, 5,0, mediumTextStyle(fontSize:16.0, color:MyColor.white))
            ],
          ),
        ),
      ),
    );
  }

  void continueOnTap() {
    if(emailController.text.trim().isEmpty){
      setState(() {
        emailError = Languages.of(context)!.enterEmail;
      });
    }else{
      CustomNavigators.pushNavigate(ForgoPasswordConfirmationView(email: emailController.text.toString(),), context);
    }
  }
}
