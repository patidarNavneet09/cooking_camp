import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../constant/my_color.dart';

class DeleteAccountPopup extends StatefulWidget {
  final Function onCallBack;
  const DeleteAccountPopup({super.key,required this.onCallBack});

  @override
  State<DeleteAccountPopup> createState() => _DeleteAccountPopupState();
}

class _DeleteAccountPopupState extends State<DeleteAccountPopup> {
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
                    Container(
                      child: Lottie.asset(
                        AssetsPath.deleteGif,
                        height: MediaQuery.of(context)
                            .size
                            .height *
                            0.17,
                        width: MediaQuery.of(context)
                            .size
                            .width,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom:5.0),
                      child: Text(
                          Languages.of(context)!.deleteAccount,
                          textAlign: TextAlign.center,
                          style:mediumTextStyle(fontSize:20.0, color: MyColor.black)
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom:25.0),
                      child: Text(
                          Languages.of(context)!.areYouSureDeleteAccount,
                          textAlign: TextAlign.center,
                          style: regularTextStyle(fontSize:15.0, color: MyColor.black)
                      ),
                    ),
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
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void yesOnTap() async{
    CustomNavigators.popNavigate(context);
    widget.onCallBack();
  }

  void noOnTap() {
    CustomNavigators.popNavigate(context);
  }

}
