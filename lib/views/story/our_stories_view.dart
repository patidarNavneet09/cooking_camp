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
import 'package:cooking_champs/views/story/story_view.dart';
import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class OurStoriesView extends StatefulWidget {
  final Function? onCallBack;
  const OurStoriesView({super.key,this.onCallBack});

  @override
  State<OurStoriesView> createState() => _OurStoriesViewState();
}

class _OurStoriesViewState extends State<OurStoriesView>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth:50,
        backgroundColor: MyColor.yellowF6F1E1,
        surfaceTintColor: MyColor.yellowF6F1E1,
        leading: InkWell(
          radius: 80,
          onTap: () {
            if(widget.onCallBack != null){
              Navigator.pop(context);
              widget.onCallBack!();
            }else{
              setState(() {
                isTabExplore = false;
              });
              CustomNavigators.pushReplacementNavigate(DashBoardView(pageIndex: 0,), context);
            }
          },
          child: Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.center,
            child: const Icon(
              Icons.arrow_back_ios,
              size:28,
              color: Colors.black,
            ),
          ),
        ),
        title:  Text(
          Languages.of(context)!.ourStories,
          style:mediumTextStyle(fontSize:18.0, color:MyColor.black)
        ),

        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          TabBar(
            dividerColor: MyColor.colorE5E9F4,
            indicatorColor: MyColor.appTheme,
            controller: _tabController,
            onTap: (value) {
              debugPrint(_tabController.index.toString());
            },
            tabs: <Widget>[
              Tab(
                child: SizedBox(
                    width: size.width * 0.50,
                    child: Center(
                        child: Text(
                      Languages.of(context)!.story,
                      style:mediumTextStyle(fontSize:16.0, color:MyColor.color1C1C1C)
                    ))),
              ),

              Tab(
                child: SizedBox(
                    width: size.width * 0.50,
                    child: Center(
                        child: Text(
                      Languages.of(context)!.recipe,
                      style:mediumTextStyle(fontSize:16.0, color:MyColor.color1C1C1C)
                    ))),
              ),

            ],
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: <Widget>[
                //storyUi(size),

                StoriesView(),
               RecipeListView(pageType: '',)

              ],
            ),
          ),
        ],
      ),
    );
  }

}
