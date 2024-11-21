import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/model/dynamic_models/recipe_model.dart';
import 'package:cooking_champs/model/dynamic_models/my_story_model.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/views/addyourrecipe.dart';
import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_color.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/views/story/add_your_stories_view.dart';
import 'package:cooking_champs/views/dashboard.dart';
import 'package:cooking_champs/views/recipe/recipe_list_view.dart';
import 'package:cooking_champs/views/storiesdetials.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class StoriesView extends StatefulWidget {
  final Function? onCallBack;
  const StoriesView({super.key,this.onCallBack});

  @override
  State<StoriesView> createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView> {
  List<StoryModel> storyList = [];
  List<StoryModel> featuredStoryList = [];
  bool isLoading = false; // To prevent multiple calls
  bool hasMoreData = true; // To track if there is more data to load
  int totalPage = 1;
  int page = 1;
  int pageRecipe = 1;
  bool load = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,getStories);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: storyUi(size),
          ),
        ],
      ),
      floatingActionButton: TouchRippleEffect(
        borderRadius: BorderRadius.circular(27),
        rippleColor: Colors.white,
        onTap: () {
            CustomNavigators.pushNavigate(AddYourStoriesView(onCallback: onCallBackStory), context);
        },
        child: const CircleAvatar(
          radius: 35,
          backgroundColor: MyColor.appTheme,
          child: Icon(
            Icons.add,
            size: 40,
            color: MyColor.white,
          ),
        ),
      ),
    );
  }

  void onCallBackStory(StoryModel model) {
    if (mounted) {
      setState(() {
        storyList.insert(0, model); // Add `model` at the first index
      });
    }
  }

  Future<void> getStories() async {
    if (isLoading || !hasMoreData) return;
    setState(() {
      isLoading = true; // Start loading
    });

    bool load = (page == 1); // Set `load` to true for the first page, false otherwise

    try {
      final onValue = await ApiServices.getStoryList(context, page.toString(), load);

      if (mounted && onValue.status == true) {
        setState(() {
          if (onValue.data['total_page'] != null) {
            totalPage = onValue.data['total_page'];
          }
          if(onValue.data['featured_stories'] != null){

          }
          var items = onValue.data['items'] as List<dynamic>? ?? []; // Safely cast items to List<dynamic>

          if (page == 1) {
            storyList.clear(); // Clear the list only on the first page
          }

          if (items.isNotEmpty) {
            // Convert items to StoryModel and add to the list
            var storyModels = items.map((item) => StoryModel.fromJson(item)).toList();

            // Sort by `id` in descending order (replace with `a.id.compareTo(b.id)` for ascending order)
            storyModels.sort((a, b) => b.id!.compareTo(a.id!));

            storyList.addAll(storyModels);
            page++; // Increment the page number for the next call
          }
          else {
            hasMoreData = false; // No more data to load
          }

          var featuredStories = onValue.data['featured_stories'] as List<dynamic>? ?? [];
          if(featuredStories.isNotEmpty){
            featuredStoryList.clear();
            // Convert items to StoryModel and add to the list
            var storyModels = featuredStories.map((item) => StoryModel.fromJson(item)).toList();
            // Sort by `id` in descending order (replace with `a.id.compareTo(b.id)` for ascending order)
            storyModels.sort((a, b) => b.id!.compareTo(a.id!));
            featuredStoryList.addAll(storyModels);
          }
        });
      }
    } catch (e) {
      debugPrint('Error fetching stories: $e');
    } finally {
      setState(() {
        isLoading = false; // End loading
      });
    }
  }

  storyUi(var size) {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Languages.of(context)!.bestFromTheChamps,
                style: mediumTextStyle(fontSize: 18.0, color: MyColor.black)),
            featuredStoryList.isNotEmpty
                ?      Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(featuredStoryList.length, (index) {
                return storyItemUi(featuredStoryList[index], size);
              }),
            )
                :
            noStory(size,Languages.of(context)!.nostoriesYet,AssetsPath.nostories, Languages.of(context)!.youhaventaddedanystoriesyet),

            hsized15,
            Text(Languages.of(context)!.yourStories,
                style: mediumTextStyle(fontSize: 18.0, color: MyColor.black)),

            storyList.isEmpty ?
            noStory(size,Languages.of(context)!.nostoriesYet,AssetsPath.nostories, Languages.of(context)!.youhaventaddedanystoriesyet)
                :
            NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !isLoading) {
                    getStories(); // Load more data when scrolled to the bottom
                  }
                  return false;
                },
                child:  Container(
                    height: 230,
                    margin: const EdgeInsets.only(bottom: 5, top:0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(storyList.length, (index) {
                              return storyItemUi(storyList[index], size);
                            }),
                          ),

                          isLoading?idLoading():SizedBox.shrink()
                        ],
                      ),
                    ))
            ),
          ],
        ),
      ),
    );
  }

  Widget storyItemUi(StoryModel model, var size) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 0, top: 10),
      child: TouchRippleEffect(
        borderRadius: BorderRadius.circular(10),
        rippleColor: Colors.white,
        onTap: () {
          CustomNavigators.pushNavigate(StoriesDetailsView(model:model,), context);
        },
        child: Container(
          decoration: const BoxDecoration(
              color: MyColor.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: size.width * 0.44,
          height: 230,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: UiUtils.networkImages(size.width * 0.44, 100,
                    model.image != null?   ApiPath.imageBaseUrl + model.image.toString():""),
              ),
              hsized8,
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.title ?? "",
                        maxLines: 1,
                        style: mediumTextStyle(
                            fontSize: 15.0, color: MyColor.black)),
                    hsized8,
                    Text(model.description ?? "",
                        maxLines: 2,
                        style: regularTextStyle(
                            fontSize: 11.0, color: MyColor.black))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  noStory(var size,String title,String img,String des) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      height: 220,
      child: Center(
        child: Container(
            width: size.width * 0.90,
            height: 180,
            decoration: const BoxDecoration(
                color: MyColor.yellowF6F1E1,
                borderRadius:
                BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image.asset(img, height: 45,),

                  hsized10,

                  Text(title,
                      style: mediumTextStyle(fontSize: 14.0, color: MyColor.black)),

                  hsized5,

                  Text(
                      des,
                      textAlign: TextAlign.center,
                      style: regularTextStyle(
                          fontSize: 12.0, color: MyColor.black)),
                ],
              ),
            )),
      ),
    );
  }

  idLoading() {
    return Container(
        height: 120,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 15,right: 30),
        child: CircularProgressIndicator());
  }
}
