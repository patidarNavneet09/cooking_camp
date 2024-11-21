class AddRecipeRequest {
  String? recipeName;
  String? recipeTools;
  String? ingredients;
  String? recipeSteps;

  AddRecipeRequest(
      {this.recipeName, this.recipeTools, this.ingredients, this.recipeSteps});

  AddRecipeRequest.fromJson(Map<String, dynamic> json) {
    recipeName = json['recipe_name'];
    recipeTools = json['recipe_tools'];
    ingredients = json['ingredients'];
    recipeSteps = json['recipe_steps'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recipe_name'] = recipeName;
    data['recipe_tools'] = recipeTools;
    data['ingredients'] = ingredients;
    data['recipe_steps'] = recipeSteps;
    return data;
  }
}