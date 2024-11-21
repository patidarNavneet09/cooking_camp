import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/model/dynamic_models/about_us_model.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/utility.dart';
import 'package:flutter/material.dart';

class AboutusDetail extends StatefulWidget {
  final String aboutId;
  const AboutusDetail({super.key,required this.aboutId});

  @override
  State<AboutusDetail> createState() => _AboutusDetailState();
}

class _AboutusDetailState extends State<AboutusDetail> {
AboutUsModel aboutUsModel = AboutUsModel();
  @override
  void initState() {
    Future.delayed(Duration.zero,aboutUs);
    super.initState();
  }
aboutUs() async {
  await ApiServices.getAboutUs(context, true, widget.aboutId).then((onValue) {
    if (mounted) {
      setState(() {
        if (onValue.status == true) {
          // Ensure `onValue.data` is a list and map it to the model.

          aboutUsModel = AboutUsModel.fromJson(onValue.data);
        }
      });
    }
  });
}


@override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:MyColor.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,size: 28,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(aboutUsModel.title??"",style:mediumTextStyle(fontSize:25.0, color:MyColor.black) ,),

             hsized10,
              Text( Utility.removeHtmlTag(aboutUsModel.description??""),style:regularNormalTextStyle(fontSize:15.0, color:MyColor.black) ,),

            hsized30,
            ],
          ),
        ),
      ),
    );
  }
}
