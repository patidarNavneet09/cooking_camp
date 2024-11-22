import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    var size = data.size;
    return  Scaffold(
      appBar:AppBar(
        surfaceTintColor: MyColor.yellowF6F1E1,
        backgroundColor: MyColor.yellowF6F1E1,
        leadingWidth: size.width * 0.09,
        leading: InkWell(
          radius: 80,
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        title: Text("Notification",style: mediumTextStyle(fontSize:18.0, color:MyColor.black),),
        centerTitle: false,
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(27),
            onTap: () {

            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text("Clear all",style: regularTextStyle(fontSize:15.0, color:MyColor.red),),
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            hsized20,

            ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,int index){
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: Text("Friend Request Accepted!",style: mediumTextStyle(fontSize:15.0, color:MyColor.black),),
                    ),

                    hsized3,
                    UiUtils.notificationCard("Good news! Jaccson Jon has accepted your friend request. Time to start cooking together and sharing the fun!","assets/images/image.png"),

                  hsized5,
                  UiUtils.dividerLine(),
                    hsized10,
                  ],
                ),
              );
            })
          ],
        ),
      ),


    );
  }


}
