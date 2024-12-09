import 'dart:convert';

import 'package:cooking_champs/constant/assets_path.dart';
import 'package:cooking_champs/constant/my_fonts_style.dart';
import 'package:cooking_champs/constant/sized_box.dart';
import 'package:cooking_champs/constant/stringfile.dart/language.dart';
import 'package:cooking_champs/model/dynamic_models/recipe_model.dart';
import 'package:cooking_champs/model/post_model/add_favorite_request.dart';
import 'package:cooking_champs/services/api_path.dart';
import 'package:cooking_champs/services/api_services.dart';
import 'package:cooking_champs/utils/navigators.dart';
import 'package:cooking_champs/utils/ui_utils.dart';
import 'package:cooking_champs/utils/utility.dart';
import 'package:cooking_champs/views/addyourrecipe.dart';
import 'package:cooking_champs/views/recipe/recipe_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

import '../../constant/my_color.dart';

class RecipeListView extends StatefulWidget {
 final String pageType;
  const RecipeListView({super.key,required this.pageType});

  @override
  State<RecipeListView> createState() => _RecipeListViewState();
}

class _RecipeListViewState extends State<RecipeListView> {
  List<RecipeModel> recipeList = [];
  RecipeModel recipeModel = RecipeModel();
  bool isLoading = false; // To prevent multiple calls
  bool hasMoreData = true; // To track if there is more data to load
  int totalPage = 1;
  int page = 1;
  String recipeId = "";

  bool isBusy  = false;
  @override
  void initState() {
    debugPrint("test.....");
    Future.delayed(Duration.zero,getRecipe);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    var size = data.size;
    return  MediaQuery(data: data.copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          body: RefreshIndicator(
             onRefresh: () async {
               page = 1;
        await Future.delayed(Duration(seconds: 2),getRecipe);
        return;
        },
            child:  NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !isLoading && totalPage >= page) {
                    Future.delayed(Duration.zero,getRecipe);
                  }
                  return false;
                },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:10.0,right:10,left:10),
                      child:recipeList.isNotEmpty?
                      ResponsiveGridRow(
                          children:List.generate(recipeList.length,(index){
                        return ResponsiveGridCol(
                        xs: 6,
                        child: gridItem(size,index,recipeList[index]));})):
                      widget.pageType == "Favorite"?
                      Container(
                        padding: EdgeInsets.only(top:size.height * 0.2),
                      alignment: Alignment.center,
                      child: noStory(size,Languages.of(context)!.noSaveRecipeyet,AssetsPath.savetagscr,Languages.of(context)!.youdonthaveanysaved),
                    ):
                      Container(
                        padding: EdgeInsets.only(top:size.height * 0.2),
                        alignment: Alignment.center,
                        child: noStory(size,Languages.of(context)!.noRecipesYet,AssetsPath.noRecipe,Languages.of(context)!.youHavenAddedAnyRecipesYet),
                      )
                         ),


                   page != 1 && isLoading? Container(
                      margin: EdgeInsets.only(top: 20,bottom: 80),
                        height: 50,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(color: MyColor.appTheme,)):SizedBox.shrink(),
                    hsized30,
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: widget.pageType == "dash" ||  widget.pageType == "Favorite"?
          Container():TouchRippleEffect(
            borderRadius: BorderRadius.circular(27),
            rippleColor: Colors.white,
            onTap: () {
              CustomNavigators.pushNavigate(AddYourRecipeView(onCallBack:onCallBackRecipe), context);
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
        )
    );
  }


  gridItem(var size ,int index,RecipeModel model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 10,right:8,left:8),
      child: Container(
        height:  widget.pageType == "dash" || widget.pageType == "Favorite"?size.height * 0.36:260,
        width:320,
        padding: const EdgeInsets.only(left:20, right:20, bottom:12, top: 10),
        decoration: BoxDecoration(
            color: model.color,
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.pageType == "dash" || widget.pageType == "Favorite"?
                Padding(
                  padding: const EdgeInsets.only(bottom:10,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TouchRippleEffect(

                        borderRadius: BorderRadius.circular(27),
                        rippleColor:model.isFavourite == "No"
                            ? MyColor.liteGray
                            : Colors.red[500],
                        onTap: () {
                          setState(() {
                            recipeModel = model;
                            recipeId = model.id??"";
                            if (model.isFavourite == "No") {
                              model.isFavourite = "Yes";
                            } else {
                              model.isFavourite = "No";
                            }
                          });
                          Future.delayed(Duration.zero,addFavorite);

                        },
                        child: CircleAvatar(
                          backgroundColor: MyColor.white,
                          child: Image.asset(
                            height: 15,
                            width: size.width * 0.20,
                            AssetsPath.savetag,
                            color:model.isFavourite != "No"? MyColor.red : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                    :SizedBox.shrink(),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: UiUtils.networkImages(size.width * 0.30,80,model.bannerImage != null? ApiPath.imageBaseUrl+model.bannerImage.toString():""),
                ),



               hsized15,
                 Text(
                     model.name??"" ,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style:semiBoldTextStyle(fontSize:15.0, color:MyColor.black)
                ),
               hsized5,
                model.recipeIngredient != null?
                SizedBox(
                  width: size.width * 0.35,
                  child:  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:model.recipeIngredient!.length > 1 ?1:model.recipeIngredient!.length ,
                    itemBuilder: (context,int index){
                    return Text(
                        model.recipeIngredient![index].name??"",
                        maxLines:2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style:regularNormalTextStyle(fontSize:12.0, color:MyColor.black)
                    );
                  },)
                ) : SizedBox.shrink(),
                 Text(
                  "More+",
                  style:regularNormalTextStyle(fontSize:12.0, color:MyColor.black)
                ),

               hsized15,

              ],
            ),
            InkWell(
              radius: 60,
              borderRadius: BorderRadius.circular(27),
             // rippleColor: MyColor.liteGray,

              onTap: (){
                CustomNavigators.pushNavigate(RecipeDetailView(model: model, color:model.color??MyColor.blueLite), context);
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: MyColor.appTheme,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: MyColor.white,
                    size: 15,
                  ),
                ),
              ),
            )
          ],
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

  void onCallBackRecipe(RecipeModel model) {
    if (mounted) {
      setState(() {
        model.isFavourite = "No";
        model.status = "0";
        recipeList.insert(0, model); // Add `model` at the first index
        for (int i = 0; i < recipeList.length; i++) {
          recipeList[i].color = Utility().getColorForIndex(i);
        }
      });
    }
  }

  Future<void> getRecipe() async {
    if (isLoading || !hasMoreData ) return;

    if(!isBusy)
      {
        setState(() {
          isBusy = true;
          isLoading = true; // Start loading
        });

        bool load = (page == 1); // Set `load` to true for the first page, false otherwise

        try {

          var onValue ;
          if(widget.pageType == "Favorite"){
            onValue = await ApiServices.getFavoriteList(context, load);
          }else{
            onValue = await ApiServices.getRecipeList(context, page.toString(), load,widget.pageType == "dash" ?"all":"");
          }


          if (mounted && onValue.status == true) {
            setState(() {
              if (onValue.data['total_page'] != null) {
                totalPage = onValue.data['total_page'];
              }

              var items = onValue.data['items'] as List<dynamic>? ?? []; // Safely cast items to List<dynamic>

              if (page == 1) {
                recipeList.clear(); // Clear the list only on the first page
              }

              if (items.isNotEmpty) {
                // Convert items to StoryModel and add to the list
                var storyModels = items.map((item) => RecipeModel.fromJson(item)).toList();

                // Sort by `id` in descending order (replace with `a.id.compareTo(b.id)` for ascending order)
                storyModels.sort((a, b) => b.id!.compareTo(a.id!));

                recipeList.addAll(storyModels);
                page++; // Increment the page number for the next call

                for (int i = 0; i < recipeList.length; i++) {
                  recipeList[i].color = Utility().getColorForIndex(i);
                }
              }
              else {
                hasMoreData = false; // No more data to load
              }
            });
          }
        } catch (e) {
          debugPrint('Error fetching stories: $e');
        } finally {
          if(mounted) {
            setState(() {
              isBusy = false;
              isLoading = false; // End loading
            });
          }
      }

    }
  }

  Future<void> addFavorite()async{
    AddFavoriteRequest favoriteRequest = AddFavoriteRequest(recipeId:int.parse(recipeId));

    await ApiServices.addToFavorite(context, favoriteRequest,true).then((onValue){
      if(mounted){
        setState(() {
          if(onValue.status == true){
            if(onValue.message.toString() == "Recipe removed from favorites successfully!"){
              if(widget.pageType == "Favorite") {
                recipeList.remove(recipeModel);
              }
             recipeModel.isFavourite = "No";
            }else{
              recipeModel.isFavourite = "Yes";
            }
          }
          else{
            recipeModel.isFavourite = "No";
          }
        });
      }
    });
  }

}
