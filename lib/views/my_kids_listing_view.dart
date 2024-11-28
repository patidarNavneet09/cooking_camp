import 'dart:convert';
import 'dart:io';
import 'package:cooking_champs/constant/dimen.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/model/dynamic_models/my_child_listing_model.dart';
import 'package:cooking_champs/model/post_model/update_kid_profile_model.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/all_dialogs.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/dashboard.dart';
import 'package:cooking_champs/views/authentication/kids_registerd_view.dart';
import 'package:cooking_champs/widgets/delete_kid_popup.dart';
import 'package:cooking_champs/widgets/global_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class MyKidsListingView extends StatefulWidget {
 final String pageType;
 final Function? onCallBack;
  const MyKidsListingView({super.key,required this.pageType,this.onCallBack});

  @override
  State<MyKidsListingView> createState() => _MyKidsListingViewState();
}

class _MyKidsListingViewState extends State<MyKidsListingView> {
  List<Items> myChildList = [];
  Items myChildModel = Items();
  String kidId = "";

  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      myChildListApi(true);
    });
    super.initState();
  }

  myChildListApi(bool load)async{
    await ApiServices.myChildListRequest(context,load).then((onValue){
      if(mounted){
        setState(() {
          if(onValue.status == true){
            if(onValue.data != null){
              var items = onValue.data['items'];
              if(items != null){
                myChildList.clear();
                for(var i in items){
                  Items model = Items.fromJson(i);
                  myChildList.add(model);
                }
              }
            }

          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: widget.pageType == "MyKids"?
        AppBar(
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
                     if(widget.onCallBack != null){
                       widget.onCallBack!();
                     }
                   // isTabExplore = false;
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                  Languages.of(context)!.myKids,
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
        )
            :null,
        body: SingleChildScrollView(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  hsized30,

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
                      Languages.of(context)!.letCreateYourKidChampProfile,
                      textAlign: TextAlign.center,
                      style:semiBoldTextStyle(fontSize:20.0, color:MyColor.black)
                  ),

                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(), // Prevents bouncing on scroll
                    itemCount:myChildList.length,
                    itemBuilder: (BuildContext context, index) {
                      Items model =  myChildList[index];

                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 8, bottom: 8),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 90,
                          decoration: BoxDecoration(
                            color: MyColor.colorF8F0FF,
                            borderRadius: BorderRadius.circular(
                                12), // Optional rounded corners
                          ),
                          alignment: Alignment
                              .center, // Centers text vertically and horizontally
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(500),
                                child:  UiUtils.networkProfile(59,59,model.kidImage != null?ApiPath.imageBaseUrl+model.kidImage.toString():""),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                        model.name??"",
                                        style:mediumTextStyle(fontSize:16.0, color: MyColor.black),
                                      ),

                                      hsized3,

                                      Text(
                                          "${model.day== null? "":" ${model.day} |"} ${model.month== null? "":" ${model.month} |"} ${model.year??""}",
                                          style:regularTextStyle(fontSize:14.0, color: MyColor.black)
                                      ),

                                      hsized3,

                                      Text(
                                          myChildList[index].grade??"",
                                          style:regularTextStyle(fontSize:14.0, color:MyColor.black)
                                      ),

                                    ],
                                  ),
                                ),
                              ),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                children: [
                                  hsized5,
                                  Row(
                                    children: [

                                      iconButton(AssetsPath.editfullback,(){editOnTap(myChildList[index]);}),

                                      SizedBox(width:10),

                                      iconButton(AssetsPath.deletefullback,(){
                                        deleteOnTap( myChildList[index]);
                                      }),

                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  hsized40,
                ],
              ),
            ),

      bottomNavigationBar:Wrap(
        children: [

          Padding(
            padding: const EdgeInsets.only(bottom: 18.0,left: 20,right: 20),
            child: GlobalButton( Languages.of(context)!.addkidsmore.toString(), MyColor.appTheme, MyColor.appTheme,btnSize55,double.infinity,addKidOnTap,55, 5, 0,semiBoldTextStyle(fontSize:16.0, color:MyColor.white)),
          ),

          widget.pageType == "MyKids"? Container(height: 20,):
          Padding(
            padding: const EdgeInsets.only(bottom:30.0,left: 20,right: 20,),
            child: GlobalButton( Languages.of(context)!.gotoHome.toString(), MyColor.white, MyColor.appTheme,btnSize55,double.infinity,goToHomeOnTap,55, 5,1,semiBoldTextStyle(fontSize:16.0, color:MyColor.appTheme)),
          ),

        ],
      ),


    );
  }


  Future<void> onRefresh() async {
    Future.delayed(Duration.zero,(){
      myChildListApi(true);
    });
  }

  iconButton(String icon, GestureTapCallback ontap) {
    return InkWell(
      onTap: ontap,
      child: Image.asset(icon, width: 30,),
    );
  }

  void editOnTap(Items item) {
    myChildModel = item;
     CustomNavigators.pushNavigate(KidsRegisterScreen(check: true,editCheck: true,myChildModel: myChildModel,onCallBack: onCallBack,), context);
  }

  void deleteOnTap(Items kid) {
    if(mounted){
      setState(() {
        kidId = kid.id??"";
        myChildModel = kid;
      });
    }
    AllDialogs.customDialog(context, DeleteKidPopup(onCallBack: onDelete,));
  }

  onDelete() async{
    UpdateKidProfile model = UpdateKidProfile(kidId:int.parse(kidId) );
  await ApiServices.deleteKid(context, model).then((onValue){
   if(mounted){
     if(onValue.status == true){
       setState(() {
         myChildList.remove(myChildModel);
       });
     }
   }
  });
  }

  void addKidOnTap() {
    CustomNavigators.pushNavigate(KidsRegisterScreen(check: true,onCallBack: onCallBack), context);
  }

  void goToHomeOnTap() {
    CustomNavigators.pushRemoveUntil(DashBoardView(pageIndex: 0,), context);
  }

  onCallBack() {
    Future.delayed(Duration.zero,(){
      myChildListApi(false);
    });
  }

}
