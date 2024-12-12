class FoodRecipeModel {
  final String? title;
  final String? description;
  final String? image;
  final List<String>? tools;
  final List<String>? ingredients;
  final List<String>? steps;

  FoodRecipeModel({
     this.title,
     this.description,
     this.image,
     this.tools,
     this.ingredients,
     this.steps,
  });
}