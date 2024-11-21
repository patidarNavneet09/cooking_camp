
import 'dart:io';

import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog extends StatefulWidget {
  Function onCallBack;
  String? cropStyle;
   ImagePickerDialog({super.key,required this.onCallBack,this.cropStyle});

  @override
  State<ImagePickerDialog> createState() => _ImagePickerDialogState();
}

class _ImagePickerDialogState extends State<ImagePickerDialog> {
  ImagePicker imagePicker = ImagePicker();
  CroppedFile? _croppedFile;
  dynamic image;
  dynamic _image;
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return  MediaQuery(data: data.copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomSheet: Wrap(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.bottomCenter,
              //  height: 110.0,
                width: MediaQuery.of(context).size.width,
               // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20,),
                child: Column(
                  children: <Widget>[

                    hsized20,
                     Text(
                      "Choose Product Images",
                      style: mediumTextStyle(fontSize:20.0, color:MyColor.appTheme)
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: button("camera", Icons.camera, cameraOnTap)),

                        SizedBox(width: 20),
                        Expanded(
                            flex: 1,
                            child:button("Gallery", Icons.image, galleryOnTap)),

                      ],
                    ),

                    hsized30,
                  ],
                ),
              ),
            ],
          )
        ));
  }

  button(String text,IconData icon ,GestureTapCallback onTap){
    return  OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(width: 1.0, color: MyColor.appTheme),
        minimumSize: const Size(110, 45),
        maximumSize: const Size(115, 45),
      ),
      onPressed:onTap,
      icon:  Icon(icon, color: MyColor.appTheme,),
      label:  Text(text,
          style:mediumTextStyle(fontSize:12.0, color:MyColor.appTheme)
      ),
    );
  }

  Future<void> chooseImage(type) async {
    if (type == "camera") {
      image = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 50);
    } else {
      image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50);
    }
    if (image != null) {
      cropImage(image.path);
    }
  }


  Future<void> cropImage(String image) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image,
      compressFormat: ImageCompressFormat.png,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          cropStyle:widget.cropStyle == null? CropStyle.circle:CropStyle.rectangle,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
          ],
        ),
        IOSUiSettings(
          title: 'Cropper',
          cropStyle: widget.cropStyle == null? CropStyle.circle:CropStyle.rectangle,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
          ],
        ),
      ],
    );
    if (croppedFile != null) {
      _croppedFile = croppedFile;
      _image = File(_croppedFile!.path);
      setState(() {});
      if (_image != null) {
        Navigator.pop(context);
        widget.onCallBack(_image);
      }
    }
  }

  void galleryOnTap() {
    chooseImage("Gallery");
  }

  void cameraOnTap() {
    chooseImage("camera");
  }
}
