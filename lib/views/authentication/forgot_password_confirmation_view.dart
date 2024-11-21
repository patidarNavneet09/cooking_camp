import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/model/post_model/login_request_model.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/views/verification.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';

class ForgoPasswordConfirmationView extends StatefulWidget {
  final String? email;
  const ForgoPasswordConfirmationView({super.key, this.email});

  @override
  State<ForgoPasswordConfirmationView> createState() => _ForgoPasswordConfirmationViewState();
}

class _ForgoPasswordConfirmationViewState extends State<ForgoPasswordConfirmationView> {
  // <<<<<<<Controller >>>>>>

  TextEditingController emailController = TextEditingController();

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
        centerTitle: false,
        title:Text(
            Languages.of(context)!.forgotPassword,
            style:mediumTextStyle(fontSize:18.0, color:MyColor.black)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(width: size.width * 0.80, AssetsPath.emaillogo),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Languages.of(context)!.youremailisontheway.toString(),
                    style: semiBoldTextStyle(fontSize:20.0, color:MyColor.black)
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                "Check your email ${widget.email} and follow \nthe instructions to reset your password",
                textAlign: TextAlign.center,
                style: regularTextStyle(fontSize:15.0, color:MyColor.black)
              ),


              SizedBox(
                height: size.height * 0.02,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Languages.of(context)!.didntreceivedanymail,
                    style:  regularTextStyle(fontSize:14.0, color:MyColor.liteGray)
                  ),

                  InkWell(
                    radius: 50,
                    onTap: () {
                    },
                    child: Text(
                      Languages.of(context)!.resend,
                      style: mediumTextStyle(fontSize:15.0, color:MyColor.appTheme)
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(bottom:20.0,left: 10,right: 10,top: 60),
                child: GlobalButton(Languages.of(context)!.enterOTP.toString(), MyColor.appTheme, MyColor.appTheme, btnSize55,double.infinity, continueOnTap, 55, 5,0, mediumTextStyle(fontSize:16.0, color:MyColor.white)),
              )
            ],
          ),
        ),
      ),
    );
  }

  void continueOnTap() {
    forgotPassApi();
  }

  forgotPassApi()async{
    LoginRequestModel forgotPass = LoginRequestModel(email: widget.email);

    await ApiServices.forgotPassword(context, forgotPass).then((onValue){
      if(mounted){
        if(onValue.status == true){
          CustomNavigators.pushNavigate(OtpVerificationView(email:widget.email), context);
        }
      }
    });
  }

}
