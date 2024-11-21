import 'dart:convert';
import 'dart:io';
import 'package:cooking_champs/constant/app_state.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/enums/register_enum.dart';
import 'package:cooking_champs/model/post_model/parent_register_model.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/services/user_prefences.dart';
import 'package:cooking_champs/utils/all_dialogs.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/utils/utility.dart';
import 'package:cooking_champs/views/authentication/kids_registerd_view.dart';
import 'package:cooking_champs/views/authentication/login_view.dart';
import 'package:cooking_champs/widgets/image_picker_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController parentEmailController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPassController = TextEditingController();

  ParentRegisterModel parentRegisterModel = ParentRegisterModel();

  List<XFile> imageFileList = [];
  File? selectedImage;
  dynamic image;
  String isFocusColor = '';

  String fNameError = "";
  String lastNameError = "";
  String parentEmailError = "";
  String emailError = "";
  String passError = "";
  String conPassError = "";


  bool isPassHide = true;
  bool isConPassHide = true;
  bool isValidate = false;
  bool isImage = false;

  String passwordImage = AssetsPath.hideEyeIc;
  String conPasswordImage = AssetsPath.hideEyeIc;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.06,
                ),
                Image.asset(
                  width: 110,
                  height: 60,
                  AssetsPath.antapanta,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  Languages.of(context)!.jointheCookingChamps,
                  style:regularTextStyle(fontSize:20.0, color: MyColor.black)
                ),

                SizedBox(
                  height: size.height * 0.001,
                ),

                Text(
                  Languages.of(context)!.signupforafunand,
                  style:regularTextStyle(fontSize:15.0, color: MyColor.black)
                ),

                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        imageFileList.clear();
                        AllDialogs.globalBottomSheet(context,
                            ImagePickerDialog(onCallBack: onCallBack), () {});
                      },
                      child: Stack(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              backgroundImage: selectedImage == null
                                  ? Image.asset(
                                      AssetsPath.demoPerson,
                                      fit: BoxFit.contain,
                                    ).image
                                  : Image.file(
                                      selectedImage!,
                                      fit: BoxFit.contain,
                                    ).image),

                          Positioned(
                            left: 70,
                            top: 60,
                            child: Image.asset(
                              AssetsPath.cameraimage,
                              height: 30,
                              width: 30,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),


                Padding(
                  padding:  EdgeInsets.all(12.0),
                  child: Column(
                    children: [

                      hsized20,
                      titleText(Languages.of(context)!.firstName.toString(),fNameError),
                      SizedBox(
                        height: size.height * 0.01,
                      ),

                      // textField(),
                      commonTextField(
                        firstNameController,
                        Languages.of(context)!.enterfirstName.toString(),
                       TextInputAction.next,
                       TextInputType.text,
                       "First Name",
                      false
                      ),

                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      titleText(Languages.of(context)!.lastName.toString(),lastNameError),

                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      commonTextField(
                        lastnameController,
                          Languages.of(context)!.enterlastName.toString(),
                          TextInputAction.next,
                          TextInputType.text,
                          "Last Name",
                         false
                      ),

                      // SizedBox(
                      //   height: size.height * 0.02,
                      // ),
                      // titleText(Languages.of(context)!.parentEmail.toString(),parentEmailError),
                      //
                      // SizedBox(
                      //   height: size.height * 0.01,
                      // ),
                      //
                      // commonTextField(
                      //     parentEmailController,
                      //     Languages.of(context)!.enterEmail.toString(),
                      //     TextInputAction.next,
                      //     TextInputType.text,
                      //     "Parent Email",
                      //   false
                      // ),

                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      titleText(Languages.of(context)!.emailstar.toString(),emailError),

                      SizedBox(
                        height: size.height * 0.01,
                      ),

                      commonTextField(
                        emailController,
                        Languages.of(context)!.enterEmail.toString(),
                        TextInputAction.next,
                        TextInputType.text,
                        "Email Star",
                        false
                      ),

                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      titleText(Languages.of(context)!.passwordstar.toString(),passError),

                      SizedBox(
                        height: size.height * 0.01,
                      ),

                      commonTextField(
                        passwordController,
                        Languages.of(context)!.enterpassword.toString(),
                        TextInputAction.next,
                        TextInputType.text,
                        "Password",
                        isPassHide
                        // lastNameOnTap
                      ),

                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      titleText(Languages.of(context)!.repeatpassword.toString(),conPassError),

                      SizedBox(
                        height: size.height * 0.01,
                      ),

                      commonTextField(
                        repeatPassController,
                        Languages.of(context)!.enterpassword.toString(),
                        TextInputAction.next,
                        TextInputType.text,
                        "Con Password",
                        isConPassHide
                        // lastNameOnTap
                      ),


                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Padding(
                        padding: EdgeInsets.zero,
                        child: Row(
                          children: [
                            Container(
                              width: size.width *
                                  0.44, // Width of the first divider
                              height: 1, // Height of the divider (thickness)
                              color: MyColor.grayLite2, // Color of the divider
                              // Optional spacing around the divider
                            ),
                            SizedBox(
                              width: size.width * 0.07,
                              child: Center(
                                child: Text(
                                  "or",
                                  style: const TextStyle(
                                      color: MyColor.grayLite2,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      fontFamily: Fonts.beVietnamProRegular),
                                ),
                              ),
                            ),
                            Container(
                              width: size.width *
                                  0.43, // Width of the first divider
                              height: 1, // Height of the divider (thickness)
                              color: MyColor.grayLite2, // Color of the divider
                              // Optional spacing around the divider
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Container(
                        width: size.width * 0.95,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColor.appTheme),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetsPath.google,
                              width: 30,
                            ),
                            Text(
                              "  Sign up with Google",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: Fonts.beVietnamProRegular,
                                color: MyColor.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        width: size.width * 0.95,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColor.appTheme),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetsPath.facebook,
                              width: 30,
                            ),
                            Text(
                              "  Sign up with Facebook",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: Fonts.beVietnamProRegular,
                                color: MyColor.black,
                              ),
                            ),
                          ],
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
                              overlayColor: MyColor.liteOrange,
                              enableFeedback: true,

                              enabledMouseCursor: MouseCursor.defer,
                              // Background color
                              // Text color (alternative)
                              elevation: 5,
                              // Optional: elevation (shadow)
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              // Custom padding
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(34), // Custom shape
                              ),
                            ),
                            onPressed: checkValidation,
                            child: Text(
                              Languages.of(context)!.register.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: Fonts.beVietnamProRegular,
                                color: MyColor.white,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have a account?",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: Fonts.beVietnamProRegular,
                              color: MyColor.black,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              CustomNavigators.pushRemoveUntil(LoginView(), context);
                            },
                            child: Text(
                              " Sign In",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: Fonts.beVietnamProRegular,
                                color: MyColor.appTheme,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  titleText(String string,String error) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(string,
                style: semiBoldTextStyle(fontSize: 14.0, color: MyColor.black)),
            Text(" *",
                style: semiBoldTextStyle(fontSize: 14.0, color: MyColor.red)),
          ],
        ),

        error.isEmpty?SizedBox.shrink():
        Expanded(child:
        Align(
            alignment: Alignment.centerRight,
            child: UiUtils.errorText(error)))

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



  onCallBack(dynamic file) {
    if (mounted) {
      setState(() {
        image = file;
        selectedImage = File(file.path);
        isImage = true;
      });
    }
  }

  checkValidation() {
    if(mounted){
      isValidate = true;
          if(firstNameController.text.trim().isEmpty){
            fNameError = Languages.of(context)!.pleaseEnterFirstName;
            isValidate = false;
          }
          if(lastnameController.text.trim().isEmpty){
            lastNameError = Languages.of(context)!.pleaseEnterLastName;
            isValidate = false;
          }
          // if(parentEmailController.text.trim().isEmpty){
          //   parentEmailError = Languages.of(context)!.pleaseEnterParentEmail;
          //   isValidate = false;
          // }
          if(Utility.validateEmail(context,emailController.text) != "null"){
            emailError = Utility.validateEmail(context,emailController.text);
            isValidate = false;
          }if(passwordController.text.trim().isEmpty || passwordController.text.length < 6){
            passError = Languages.of(context)!.atleast5.toString();
            isValidate = false;
          }if(repeatPassController.text.trim().isEmpty){
            conPassError = Languages.of(context)!.atleast5.toString();
            isValidate = false;
          }
          else if(repeatPassController.text.trim() != passwordController.text.trim()){
            conPassError = Languages.of(context)!.confirmPassNotMatch.toString();
            isValidate = false;
          }
          if(!isImage){
            Utility.customToast(context, Languages.of(context)!.pleaseUploadProfile);
            isValidate = false;
          }
        setState(() {});
          if(isValidate) {
            fNameError = "";
            lastNameError = "";
            parentEmailError = "";
            emailError = "";
            passError = "";
            conPassError = "";
           parentRegister();
        }

    }

  }

  parentRegister() async {
    String fcm = await PreferencesServices.getPreferencesData(PreferencesServices.fcm) ?? "";
    parentRegisterModel = ParentRegisterModel(
        role: RegisterType.roleParent.value,
        firstName: firstNameController.text,
        lastName: lastnameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: repeatPassController.text,
        fcmToken: fcm,
        deviceId: AppState.deviceIdStr,
        deviceType: AppState.devicetype);

    await ApiServices.parentRegister(context, parentRegisterModel, image)
        .then((onValue) {
      if (mounted) {
        if (onValue.status != null && onValue.status != false) {
          CustomNavigators.pushRemoveUntil(KidsRegisterScreen(check: false,), context);
        }
      }
    });
  }

  void firstNameOnTap() {
    if(mounted) {
      setState(() {
      isFocusColor = "First Name";
    });
    }
  }

  void lastNameOnTap() {
    if(mounted) {
      setState(() {
        isFocusColor = "Last Name";
      });
    }
  }
}


