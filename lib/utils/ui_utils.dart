import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UiUtils{
  static errorText(String error){
    return   Text(
        error,
        style:regularTextStyle(fontSize:14.0, color: MyColor.red)
    );
  }

  static networkProfile(double width, double height, String img) {
    return Container(
        width: width,
        decoration: BoxDecoration(
            color: MyColor.white,
            borderRadius: BorderRadius.circular(8)),
        child:img.isNotEmpty && img != ApiPath.imageBaseUrl?
        ClipRRect(
          borderRadius: BorderRadius.circular(500),
          child: Image.network(img,width:width,height:height,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return  SizedBox(
                height: height,
                width: width,
              );
            },
            errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
              return  SizedBox(
                height: height,
                width: width,
             //   child: Image.asset(AssetsPath.),
              );
            },
          ),
        ): SizedBox(
          height: height,
          width: width,
        )



      /* Image.network(
       img,
        // height: height,
        width: width,
        // fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          return const Center(child: CircularProgressIndicator(color: MyColors.appTheme,));
        },
      ),*/
    );
  }

  static networkImages(double width, double height, String img) {
    return Container(
        width: width,
        decoration: BoxDecoration(
            color: MyColor.white,
            borderRadius: BorderRadius.circular(8)),
        child:img.isNotEmpty && img != ApiPath.imageBaseUrl?
        Image.network(img,width:width,height:height,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return   Container(
              decoration: BoxDecoration(
                  color: MyColor.colorFFFED6
              ),
              height: height,
              width: width,
            );
          },
          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
            return  Container(
              decoration: BoxDecoration(
                color: MyColor.colorFFFED6
              ),
              height: height,
              width: width,
            );
          },
        ):  Container(
          decoration: BoxDecoration(
              color: MyColor.colorFFFED6
          ),
          height: height,
          width: width,
        )
    );
  }

  static dividerLine(){
    return Container(
      height:1.3,
      width: double.infinity,
      color:MyColor.grayLite,
    );
  }

  static tabItem(BuildContext context,var size,String text){
    return Tab(
      child: SizedBox(
          width: size.width * 0.50,
          child: Center(
              child: Text(
                text,
                style:mediumTextStyle(fontSize:14.0, color:MyColor.color1C1C1C)
              ))),
    );
  }

  static friendRequestUi(String text,String detail,String img,String type,Function onCallBack){
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
            decoration: BoxDecoration(
              color: MyColor.white,
              borderRadius: BorderRadius.circular(12), // Optional rounded corners
            ),
            alignment: Alignment.center, // Centers text vertically and horizontally
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: UiUtils.networkProfile(60.0,60.0, img),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:10, top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                text,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:mediumTextStyle(fontSize:16.0, color:MyColor.black)
                              ),

                            hsized3,


                               Text(
                                detail,
                                   maxLines: 2,
                                   overflow: TextOverflow.ellipsis,
                                style:regularTextStyle(fontSize:14.0, color:MyColor.black)
                              ),

                            ],
                          ),
                        ),
                        type == "Request"?
                        Row(
                          children: [
                            InkWell(
                                radius:60,
                                onTap: () {
                                  debugPrint("jnxdjkhigfj");
                                  onCallBack("Accept");
                                },
                                child: SvgPicture.asset(AssetsPath.fillCheck)),


                            SizedBox(
                              width: 5,
                            ),

                            InkWell(
                                radius:60,
                                onTap: () {
                                  onCallBack("Reject");
                                },
                                child: SvgPicture.asset(AssetsPath.fillCancel)),
                          ],
                        )
                            :SizedBox.shrink()
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }


 static notificationCard(String des,String img){
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Container(
        padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
        decoration: BoxDecoration(
          color: MyColor.white,
          borderRadius: BorderRadius.circular(12), // Optional rounded corners
        ),
        alignment: Alignment.center, // Centers text vertically and horizontally
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child:UiUtils.networkProfile(60.0,60.0, img),
              //Image.asset(img,height: 60,width: 60,)
              //UiUtils.networkProfile(60.0,60.0, img),
            ),
           SizedBox(width: 15,),

            Expanded(
              child:  Text(
                  des,
                  style:regularTextStyle(fontSize:13.0, color:MyColor.black)
              )),
          ],
        ),
      ),
    );
  }

  static questionAnswerUi(String img,String question,String answer,int index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hsized15,
        img.trim().isEmpty?
        SizedBox(height:50,width:107,):
            Padding(padding: EdgeInsets.only(left:17),child:Image.asset(img,height: 80,width:107,)),
        hsized8,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$index.",style:semiBoldTextStyle(fontSize:16.0, color:MyColor.red1),),
            SizedBox(width:10),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(question,style:semiBoldTextStyle(fontSize:15.80, color:MyColor.red1),),

                hsized5,
                Text(answer,style:regularTextStyle(fontSize:14.50, color:MyColor.black)),
              ],
            )),
          ],
        ),

      ],
    );
  }

 static roundedPage(){
    return   Align(
        alignment: Alignment.bottomRight,
        child: Image.asset(
          AssetsPath.cornerBg,
          height: 110,
          width: 110,
        ));
  }

}