import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/model/dynamic_models/home_model.dart';
import 'package:cooking_champs/model/dynamic_models/my_story_model.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/story/storie_detials.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/model/dynamic_models/home_model.dart';
import 'package:cooking_champs/model/dynamic_models/my_story_model.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class AllStoryView extends StatefulWidget {
  const AllStoryView({super.key});

  @override
  State<AllStoryView> createState() => _AllStoryViewState();
}

class _AllStoryViewState extends State<AllStoryView> {
  List<StoryModel> fullStoryList = []; // Complete list fetched from API
  List<StoryModel> featuredStoryList = []; // Paginated list shown in UI
  int currentPage = 1; // Tracks pagination
  final int pageSize = 1; // Number of items per page
  bool isLoading = false;
  bool hasMoreData = true;

  @override
  void initState() {
    super.initState();
    fetchInitialData();
  }

  /// Fetch full list from API and initialize pagination
  void fetchInitialData() async {
    setState(() => isLoading = true);
    try {
      if(currentPage == 1){
        fullStoryList.clear();
      }
      final response = await ApiServices.home(context, true); // Fetch complete list
      if (response.status == true) {
        HomeModel homeModel = HomeModel.fromJson(response.data);
        if (homeModel.featuredStories != null && homeModel.featuredStories!.isNotEmpty) {
          fullStoryList = homeModel.featuredStories!; // Store complete list
          loadMoreData(); // Load first page
        }
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  /// Load more data for pagination
  void loadMoreData() {
    int nextItemsStart = (currentPage - 1) * pageSize;
    int nextItemsEnd = nextItemsStart + pageSize;

    if (nextItemsStart < fullStoryList.length) {
      setState(() {
        featuredStoryList.addAll(
          fullStoryList.sublist(
            nextItemsStart,
            nextItemsEnd > fullStoryList.length ? fullStoryList.length : nextItemsEnd,
          ),
        );
        currentPage++;
        if (featuredStoryList.length >= fullStoryList.length) {
          hasMoreData = false; // No more data to load
        }
      });
    } else {
      hasMoreData = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    var size = data.size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.colorFFFED6,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        title: Text(
          "Memories",
          style: mediumTextStyle(fontSize: 18.0, color: MyColor.black),
        ),
        centerTitle: false,
      ),
      body: featuredStoryList.isNotEmpty
          ? NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
              hasMoreData &&
              !isLoading) {
            loadMoreData(); // Load next page
          }
          return false;
        },
        child: ListView.builder(
          itemCount: featuredStoryList.length + 1, // Add 1 for loading indicator
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            if (index < featuredStoryList.length) {
              var model = featuredStoryList[index];
              return storyItem(model, size);
            } else {
              return _buildLoadingIndicator(); // Loading or end message
            }
          },
        ),
      )
          : currentPage !=1 && isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(child: Text("No Stories Available")),
    );
  }

  /// Widget to build story item
  Widget storyItem(StoryModel model, Size size) {
    return InkWell(
      onTap: (){
        CustomNavigators.pushNavigate(StoriesDetailsView(model:model, type: '',), context);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5, top: 10),
        child: Container(
          decoration: const BoxDecoration(
            color: MyColor.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: UiUtils.networkImages(
                  size.width,
                  160,
                  "${ApiPath.imageBaseUrl}${model.image}",
                ),
              ),
              hsized10,
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  model.title ?? "",
                  style: mediumTextStyle(fontSize: 15.0, color: MyColor.black),
                ),
              ),
              hsized10,
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  model.description ?? "",
                  style: regularTextStyle(fontSize: 11.0, color: MyColor.black),
                ),
              ),
              hsized15,
              UiUtils.dividerLine(),
              hsized5,
            ],
          ),
        ),
      ),
    );
  }

  /// Widget for the loading indicator or no more data
  Widget _buildLoadingIndicator() {
    if (hasMoreData) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Center(
        child: featuredStoryList.isNotEmpty?
            SizedBox.shrink():
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "No more stories to load",
            style: regularTextStyle(fontSize: 14.0, color: MyColor.liteGray),
          ),
        ),
      );
    }
  }
}




/*class AllStoryView extends StatefulWidget {
  const AllStoryView({super.key});

  @override
  State<AllStoryView> createState() => _AllStoryViewState();
}

class _AllStoryViewState extends State<AllStoryView> {
  List<StoryModel> featuredStoryList = [];
  bool isLoading = false;
  @override
  void initState() {
    fetchData();
    super.initState();
  }
  fetchData(){
    Future.delayed(Duration.zero,(){
      home(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    var size = data.size;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:MyColor.colorFFFED6,
        // leadingWidth: 0.08,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left:20.0),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        title: Text(Languages.of(context)!.memories,style:mediumTextStyle(fontSize:18.0, color:MyColor.black),),
        centerTitle: false,
      ),
      body:  featuredStoryList.isNotEmpty?
      NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !isLoading) {
            home(false); // Load more data when scrolled to the bottom
          }
          return false;
        },
        child:ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount:featuredStoryList.length,
          itemBuilder: (context, index) {
            var model  = featuredStoryList[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: TouchRippleEffect(
                borderRadius: BorderRadius.circular(10),
                rippleColor: Colors.white,
                onTap: () {
                  CustomNavigators.pushNavigate(StoriesDetailsView(model:model, type: '',), context);
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: MyColor.white,
                      borderRadius:
                      BorderRadius.all(Radius.circular(10))),
                  width: size.width,
                  // height: 250,
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ Padding(
                  padding: const EdgeInsets.only(left:20, right:20),
                  child: UiUtils.networkImages(size.width,160,"${ApiPath.imageBaseUrl}${model.image}")),

                      hsized10,

                      Padding(
                        padding: const EdgeInsets.only(left:20, right:20),
                        child: Text(
                            model.title??"",
                            style:mediumTextStyle(fontSize:15.0, color:MyColor.black)
                        ),
                      ),

                      hsized10,
                      Padding(
                        padding: const EdgeInsets.only(left:20, right:20),
                        child: Text(
                          model.description??"",
                            style:regularTextStyle(fontSize: 11.0, color:MyColor.black)
                        ),
                      ),

                      hsized15,


                      UiUtils.dividerLine(),
                      hsized5,
                    ],
                  ),
                ),
              ),
            );
          }),)
          :SizedBox.shrink()
    );
  }

  void home(bool load) async{
    await ApiServices.home(context, load).then((onValue){
      if(mounted){
        if(onValue.status == true){
          setState(() {
            if(onValue.data != null){
              HomeModel  homeModel = HomeModel.fromJson(onValue.data);

              if(homeModel.featuredStories!.isNotEmpty){
                featuredStoryList.addAll(homeModel.featuredStories!);
              }
            }
          });
        }
      }
    });
  }
}*/
