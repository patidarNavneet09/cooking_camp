import 'dart:io';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/model/dynamic_models/update_parent_profile_model.dart';
import 'package:cooking_champs/model/dynamic_models/user_identity_model.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/all_dialogs.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/dashboard.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:cooking_champs/widgets/image_picker_dialog.dart';
import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class EditProfileView extends StatefulWidget {
  final Function onUpdate;
  const EditProfileView({super.key,required this.onUpdate});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  // <<<<<<<Controller >>>>>>

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();

  UserIdentityModel userDetail = UserIdentityModel();

  File? selectedImage;
  String imageUrl= "";
  dynamic isFocusColor = '';
  dynamic image;
  String base64Image = "";
  bool isImage = false;

  String firstNameError = "";
  String lastNameError = "";

  @override
  void initState() {
   Future.delayed(Duration.zero,getProfileDetail);
    super.initState();
  }

  getProfileDetail()async{
    await ApiServices.userDetail(context,"",true).then((onValue){
      if(mounted){
        setState(() {
          if(onValue.status == true){
            if(onValue.data != null){
              userDetail = UserIdentityModel.fromJson(onValue.data);
              if(userDetail.firstName != null){
                setData();
              }
            }
          }
        });
      }
    });
  }

  setData(){
    setState(() {
    firstNameController.text = userDetail.firstName??"";
    lastnameController.text = userDetail.lastName??"";
    imageUrl = userDetail.image??"";
    });
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

        leadingWidth: 0, automaticallyImplyLeading: false,
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
                  widget.onUpdate();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              Text(
                Languages.of(context)!.editProfile,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    AllDialogs.globalBottomSheet(context,ImagePickerDialog(onCallBack: onCallBack),(){});
                  },
                  child: Stack(
                    children: [
                       SizedBox(
                              child:

                      ClipRRect(
                        borderRadius: BorderRadius.circular(500),
                        child:
                        isImage?
                        Image.file(selectedImage!, fit: BoxFit.contain, height: 120,
                          width: 120,):
                        imageUrl.isNotEmpty?
                        UiUtils.networkProfile(120, 120, ApiPath.imageBaseUrl+imageUrl)
                            :Image.asset(
                          height: 120,
                          width: 120,
                          AssetsPath.demoPerson,
                          fit: BoxFit.contain,
                        )
                      )
                       ),
                      Positioned(
                        left: 90,
                        top: 80,
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
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  hsized20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Languages.of(context)!.firstName.toString(),
                        style: regularTextStyle(fontSize:15.0, color:MyColor.black)
                      ),
                      UiUtils.errorText(firstNameError)
                    ],
                  ),

                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  commonTextField(firstNameController,Languages.of(context)!.enterfirstName.toString(),TextInputAction.done,TextInputType.text,"Last Name"),


                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Languages.of(context)!.lastName.toString(),
                        style:regularTextStyle(fontSize: 15.0, color:MyColor.black)
                      ),
                      UiUtils.errorText(lastNameError)
                    ],
                  ),

                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  commonTextField(lastnameController,Languages.of(context)!.enterlastName.toString(),TextInputAction.done,TextInputType.text,"Last Name"),

                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet:  Container(
          padding: EdgeInsets.only(bottom:20,left: 20,right: 20),
          child: GlobalButton( Languages.of(context)!.update.toString(), MyColor.appTheme, MyColor.appTheme,btnSize55,double.infinity, updateOnTap, 55,5, 0,mediumTextStyle(fontSize:15.0, color:MyColor.white))),

    );
  }

  commonTextField(
      TextEditingController controller,
      String labelText,
      TextInputAction textInputAction,
      TextInputType textInputType,
      String type,
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

  void updateOnTap(){
    bool isValid = true;
    if(mounted){
      setState(() {
        if(firstNameController.text.trim().isEmpty){
          firstNameError = Languages.of(context)!.pleaseEnterFirstName;
          isValid = false;
        }if(lastnameController.text.trim().isEmpty){
          firstNameError = Languages.of(context)!.pleaseEnterLastName;
          isValid = false;
        }
      });
      if(isValid){
        Future.delayed(Duration.zero,updateProfile);
      }
    }
  }

  updateProfile()async{
    UpdateParentProfileModel model = UpdateParentProfileModel(firstName: firstNameController.text,lastName: lastnameController.text);
    var onValue;
  if(isImage){
    onValue =  await ApiServices.updateUserProfile(context, model, image);

  }else{
    onValue =  await ApiServices.updateUserProfile(context, model,null);
  }
    if(mounted){
      if(onValue.status == true){
        setState(() {
          isTabExplore =false;
        });
       await Future.delayed(Duration.zero,getProfileDetail);
        CustomNavigators.pushRemoveUntil(DashBoardView(pageIndex: 0,), context);
      }
    }
  }
}
