import 'package:cooking_champs/model/dynamic_models/my_story_model.dart';
import 'package:cooking_champs/model/dynamic_models/recipe_model.dart';

class HomeModel {
  RecipeModel? recipeOfTheWeek;
  List<RecipeModel>? popularRecipes;
  List<StoryModel>? featuredStories;

  HomeModel({this.recipeOfTheWeek, this.popularRecipes, this.featuredStories});

  HomeModel.fromJson(Map<String, dynamic> json) {
    recipeOfTheWeek = json['recipe_of_the_week'] != null
        ? RecipeModel.fromJson(json['recipe_of_the_week'])
        : null;
    if (json['popular_recipes'] != null) {
      popularRecipes = <RecipeModel>[];
      json['popular_recipes'].forEach((v) {
        popularRecipes!.add(RecipeModel.fromJson(v));
      });
    }
    if (json['featured_stories'] != null) {
      featuredStories = <StoryModel>[];
      json['featured_stories'].forEach((v) {
        featuredStories!.add(StoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (recipeOfTheWeek != null) {
      data['recipe_of_the_week'] = recipeOfTheWeek!.toJson();
    }
    if (popularRecipes != null) {
      data['popular_recipes'] =
          popularRecipes!.map((v) => v.toJson()).toList();
    }
    if (featuredStories != null) {
      data['featured_stories'] =
          featuredStories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


