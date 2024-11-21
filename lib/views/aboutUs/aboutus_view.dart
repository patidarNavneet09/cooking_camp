import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/model/dynamic_models/about_us_model.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/all_dialogs.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/utils/utility.dart';
import 'package:cooking_champs/views/aboutUs/aboutus_detail.dart';
import 'package:cooking_champs/views/dashboard.dart';
import 'package:cooking_champs/views/menu/menu_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
   List<AboutUsModel> aboutUsList = [];
@override
  void initState() {
  Future.delayed(Duration.zero,aboutUs);
    super.initState();
  }
  aboutUs()async{
  await ApiServices.getAboutUs(context, true,"").then((onValue){
    if(mounted){
      setState(() {
        if(onValue.status == true){
          var data = onValue.data as List<dynamic>? ??[];
          var about = data.map((item) => AboutUsModel.fromJson(item)).toList();
         aboutUsList.addAll(about);
        }
      });
    }
  });
  }

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
                  CustomNavigators.pushRemoveUntil(const DashBoardView(
                    pageIndex:0,
                    tabCheck: "",
                  ), context);
                  isTabExplore = false;
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              Text(
                Languages.of(context)!.aboutUs,
                style:mediumTextStyle(fontSize:18.0, color:MyColor.black)
              ),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ResponsiveGridRow(
                children: List.generate(aboutUsList.length, (index) {
                  var model = aboutUsList[index];
                  return ResponsiveGridCol(
                      xs: 6,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, bottom: 5, top: 10),
                        child: TouchRippleEffect(
                          borderRadius: BorderRadius.circular(27),
                          rippleColor: Colors.white,
                          onTap: () {
                            CustomNavigators.pushNavigate(AboutusDetail(aboutId:model.id??""), context);
                          },
                          child: Container(
                            height: 270,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color:Utility.hexToColor(model.colorCode??"#f1e0e0"),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                CircleAvatar(
                                  radius: 52,
                                  backgroundColor: MyColor.white,
                                  child:ClipRRect(
                                    borderRadius: BorderRadius.circular(500),
                                    child:  UiUtils.networkProfile(104,104,model.image != null?ApiPath.imageBaseUrl+model.image.toString():"" ),
                                  )   ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        aboutUsList[index].title??"",
                                        textAlign: TextAlign.center,
                                        style:semiBoldTextStyle(fontSize:15.0, color:MyColor.black)
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),

                                const SizedBox(
                                  height: 15,
                                ),
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: MyColor.appTheme,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: MyColor.white,
                                    size: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ));
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
