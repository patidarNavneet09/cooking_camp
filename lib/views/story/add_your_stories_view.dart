import 'dart:convert';
import 'dart:io';
import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/model/dynamic_models/my_story_model.dart';
import 'package:cooking_champs/model/post_model/add_stories_request.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/all_dialogs.dart';
import 'package:cooking_champs/utils/utility.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:cooking_champs/widgets/image_picker_dialog.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class AddYourStoriesView extends StatefulWidget {
  final Function onCallback;
  const AddYourStoriesView({super.key,required this.onCallback});

  @override
  State<AddYourStoriesView> createState() => _AddYourStoriesViewState();
}

class _AddYourStoriesViewState extends State<AddYourStoriesView> {
  List<XFile> imageFileList = [];
  dynamic image;
  File? selectedImage1;
  File? selectedImage2;

  dynamic _isFocusColor = '';

  TextEditingController titleController = TextEditingController();
  TextEditingController storyController = TextEditingController();


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
              SizedBox(width: 10),
              Text(
                Languages.of(context)!.addYourStories,
                style:mediumTextStyle(fontSize:18.0, color:MyColor.black)
              ),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  Languages.of(context)!.addarecentmoment,
                  style:mediumTextStyle(fontSize:18.0, color:MyColor.black)
              ),

              Text(
                  Languages.of(context)!.openyourphotogalleryto,
                  style:regularTextStyle(fontSize:14.0, color:MyColor.black)
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DottedBorder(
                      color: MyColor.appTheme,
                      strokeWidth: 2,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      dashPattern: selectedImage1 != null
                          ? [200, 0]
                          : const [02, 10],
                      child: TouchRippleEffect(
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        rippleColor: MyColor.appTheme.withOpacity(0.8),
                        onTap: () {
                          AllDialogs.globalBottomSheet(context,ImagePickerDialog(onCallBack: onCallBackImage1,cropStyle: "rectangle"),(){});
                        },
                        child: selectedImage1 != null
                            ? Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              height: size.height * 0.19,
                              width: size.width * 0.40,
                              decoration: const BoxDecoration(
                                color: MyColor.yellowF6F1E1,
                              ),
                              child: Image.file(
                                selectedImage1!,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.only(right:0,bottom: 5),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedImage1 = null;
                                  });
                                },
                                child: Icon(Icons.cancel,color: MyColor.white,),
                              ),
                            )
                          ],
                        )
                            : Container(
                            height: size.height * 0.19,
                            width: size.width * 0.40,
                            decoration: const BoxDecoration(
                              color: MyColor.yellowF6F1E1,
                            ),
                            child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        width: 35,
                                        height: 35,
                                        AssetsPath.addimage),
                                    Text(
                                      Languages.of(context)!.addImage,
                                      style: const TextStyle(
                                        color: MyColor.appTheme,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        fontFamily: Fonts.beVietnamProRegular,
                                      ),
                                    ),
                                  ],
                                ))),
                      )),

                  DottedBorder(
                      color: MyColor.appTheme,
                      strokeWidth: 2,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      dashPattern: selectedImage2 != null
                          ? [200, 0]
                          : const [02, 10],
                      child: TouchRippleEffect(
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        rippleColor: MyColor.appTheme.withOpacity(0.8),
                        onTap: () {
                          AllDialogs.globalBottomSheet(context,ImagePickerDialog(onCallBack: onCallBackImage2,cropStyle:"rectangle"),(){});
                          /*   showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                      // <-- SEE HERE
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20.0),
                                      ),
                                    ),
                                    context: context,
                                    builder: ((builder) =>
                                        bottomSheet1("Two")));*/
                        },
                        child: selectedImage2 != null ? Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              height: size.height * 0.19,
                              width: size.width * 0.40,
                              decoration: const BoxDecoration(
                                color: MyColor.yellowF6F1E1,
                              ),
                              child: Image.file(
                                selectedImage2!,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.only(right:0,bottom: 5),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedImage2 = null;
                                    imageFileList.clear();
                                  });
                                },
                                child: Icon(Icons.cancel,color: MyColor.white,),
                              ),
                            )
                          ],
                        )
                            : Container(
                            height: size.height * 0.19,
                            width: size.width * 0.40,
                            decoration: const BoxDecoration(
                              color: MyColor.yellowF6F1E1,
                            ),
                            child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        width: 35,
                                        height: 35,
                                        AssetsPath.addimage),
                                    Text(
                                      Languages.of(context)!.addImage,
                                      style: const TextStyle(
                                        color: MyColor.appTheme,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        fontFamily: Fonts.beVietnamProRegular,
                                      ),
                                    ),
                                  ],
                                ))),
                      )),
                ],
              ),
              hsized30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                      Languages.of(context)!.momentStoryTitle,
                      style:mediumTextStyle(fontSize:15.0, color:MyColor.black)
                  ),

                  Text(
                      Languages.of(context)!.max30Words,
                      style:regularTextStyle(fontSize:14.0, color:MyColor.appTheme)
                  ),
                ],
              ),

              hsized15,

              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: _isFocusColor == "Enter title"
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
                  onTap: () {
                    _isFocusColor = "Enter title";
                  },
                  maxLength: 30,
                  onTapOutside: (v){
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  buildCounter: (BuildContext context, {required int currentLength, int? maxLength, required bool isFocused}) => null,
                  controller: titleController,
                  textInputAction: TextInputAction.next,
                  style: regularTextStyle(fontSize:14.0, color: MyColor.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: Languages.of(context)!.entertitle.toString(),
                    hintStyle:regularTextStyle(fontSize:14.0, color: MyColor.grayLite1),
                    counter: const Offstage(),
                    isDense: true,
                    contentPadding: const EdgeInsets.only(top: 10,),
                  ),
                  maxLines: 1,
                  cursorColor: MyColor.black,
                ),
              ),

              hsized30,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      Languages.of(context)!.yourStoryMoment,
                      style:regularTextStyle(fontSize:15.0, color:MyColor.black)
                  ),
                  Text(
                      Languages.of(context)!.min200Words,
                      style:regularTextStyle(fontSize:14.0, color:MyColor.appTheme)
                  ),
                ],
              ),

              hsized15,

              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: _isFocusColor == "writehere"
                          ? MyColor.liteOrange
                          : MyColor.grayLite),
                  color: MyColor.white,
                  borderRadius:
                  const BorderRadius.all(Radius.circular(12)),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(12, 5, 0, 15),
               // height: 165,
                child: TextField(
                  maxLength: 200,
                  minLines: 5,
                  textCapitalization: TextCapitalization.sentences,
                  onTap: () {
                    _isFocusColor = "writehere";
                  },
                  buildCounter: (BuildContext context,
                      {required int currentLength,
                        int? maxLength,
                        required bool isFocused}) =>
                  null,
                  controller: storyController,
                  onTapOutside: (v){
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  style:regularTextStyle(fontSize:14.0, color:MyColor.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: Languages.of(context)!.writehere.toString(),
                    hintStyle: regularTextStyle(fontSize:14.0, color:MyColor.grayLite1),
                    counter: const Offstage(),
                    isDense: true,
                    contentPadding: const EdgeInsets.only(top: 10,),
                  ),
                  maxLines: 10000,
                  cursorColor: MyColor.black,
                ),
              ),

              hsized30,
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        //height: 80,
        padding: const EdgeInsets.only(bottom:30.0,left:20,right:20),
        child: GlobalButton(Languages.of(context)!.add.toString(), MyColor.appTheme, MyColor.appTheme, btnSize55,double.infinity, addOnTap, 55, 5,0, mediumTextStyle(fontSize:16.0, color:MyColor.white)),
      ),
    );
  }


  void addOnTap() {
    if(titleController.text.trim().isEmpty){
      Utility.customToast(context, Languages.of(context)!.entertitle);
    }else if(titleController.text.length != 30){
      Utility.customToast(context, Languages.of(context)!.max30Words);
    }else if(storyController.text.trim().isEmpty){
      Utility.customToast(context, Languages.of(context)!.story);
    }
    // else if(storyController.text.length <= 200){
    //   Utility.customToast(context, Languages.of(context)!.min200Words);
    // }
    else{
      Future.delayed(Duration.zero,addStories);
    }

  }

  addStories()async{
    AddStoriesRequest addStoriesRequest = AddStoriesRequest(
      title:titleController.text,
      description:storyController.text
    );
    await ApiServices.addStories(context, addStoriesRequest,selectedImage1,imageFileList).then((onValue){
      if(onValue.status == true){
        var data = StoryModel.fromJson(onValue.data);
        Navigator.pop(context);
        widget.onCallback(data);
      }

    });
  }

  onCallBackImage1(var file) {
    setState(() {
      selectedImage1 = File(file.path);
    });
  }
  onCallBackImage2(var file) {
    setState(() {
      selectedImage2 = File(file.path);
      imageFileList.add(XFile(selectedImage2!.path));
    });
  }
}
