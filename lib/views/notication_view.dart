import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/model/dynamic_models/notification_model.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List<NotificationModel> notificationList = [];
  int page = 1; // Current page
  int totalPage = 1; // Total pages from the API
  bool isLoading = false; // To prevent multiple calls at the same time

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, getNotification); // Fetch notifications initially
  }

  Future<void> getNotification() async {
    if (isLoading || page > totalPage) return; // Prevent redundant calls

    setState(() {
      isLoading = true; // Set loading to true while fetching data
    });

    try {
      final response = await ApiServices.getNotification(context, true, page);

      if (response.status == true) {
        if (mounted) {
          setState(() {
            totalPage = response.data['total_page']; // Update total pages
            final items = response.data['items'] as List;
if(page ==1){
  notificationList.clear();
}
            for (var n in items) {
              NotificationModel model = NotificationModel.fromJson(n);
              notificationList.add(model); // Add new notifications to the list
            }

            page++; // Increment the page for the next load
          });
        }
      }
    } finally {
      setState(() {
        isLoading = false; // Set loading to false after fetching
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    var size = data.size;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: MyColor.yellowF6F1E1,
        backgroundColor: MyColor.yellowF6F1E1,
        leadingWidth: size.width * 0.09,
        leading: InkWell(
          radius: 80,
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        title: Text(
          "Notification",
          style: mediumTextStyle(fontSize: 18.0, color: MyColor.black),
        ),
        centerTitle: false,
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(27),
            onTap: () {
              setState(() {
                notificationList.clear();
                page = 1;
              });
              getNotification(); // Clear notifications and reload
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                "Clear all",
                style: regularTextStyle(fontSize: 15.0, color: MyColor.red),
              ),
            ),
          )
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
              !isLoading &&
              page <= totalPage) {
            getNotification(); // Load more notifications when reaching the end
          }
          return false;
        },
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 30),
          itemCount: notificationList.length + (isLoading ? 1 : 0), // Add 1 for the loader
          itemBuilder: (context, index) {
            if (index == notificationList.length) {
              return  Center(
                child: Padding(
                padding: EdgeInsets.all(8.0),
                child:page ==1?SizedBox.shrink():
                CircularProgressIndicator(),
              ),
              );
            }

            var notification = notificationList[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    notification.message ?? "",
                    style: mediumTextStyle(fontSize: 15.0, color: MyColor.black),
                  ),
                ),
                hsized3,
                UiUtils.notificationCard(
                  notification.title ?? "",
                  notification.userDetails?.image != null
                      ? ApiPath.imageBaseUrl + notification.userDetails!.image
                      : "",
                ),
                hsized5,
                UiUtils.dividerLine(),
                hsized10,
              ],
            );
          },
        ),
      ),
    );
  }
}


/*class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List<NotificationModel> notificationList = [];
  int page = 1;
 int totalPage = 1;
 bool isLoading = false;

  @override
  void initState() {
   Future.delayed(Duration.zero,getNotification);
    super.initState();
  }
  getNotification()async{
    await ApiServices.getNotification(context, true,page).then((onValue){
      if(onValue.status == true){
      if(mounted){
        setState(() {
          if(page == 1){
            notificationList.clear();
          }
          for(var n in onValue.data['items']) {
            NotificationModel model = NotificationModel.fromJson(n);
            notificationList.add(model);
          }
        });
      }
      }
    });
  }

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

      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo){
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !isLoading && totalPage >= page) {
            Future.delayed(Duration.zero,getNotification);
          }
          return false;
        },
        child:ListView.builder(
            shrinkWrap: true,
            itemCount:notificationList.length,
           // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,int index){
              var notification = notificationList[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: Text(notification.message??"",style: mediumTextStyle(fontSize:15.0, color:MyColor.black),),
                  ),

                  hsized3,
                  UiUtils.notificationCard(notification.title??"",notification.userDetails!.image != null? ApiPath.imageBaseUrl+notification.userDetails!.image.toString():""),

                  hsized5,
                  UiUtils.dividerLine(),
                  hsized10,
                ],
              );
            }),
      ),


    );
  }


}*/
