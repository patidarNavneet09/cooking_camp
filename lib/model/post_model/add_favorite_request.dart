class AddFavoriteRequest {
  int? recipeId;

  AddFavoriteRequest({this.recipeId});

  AddFavoriteRequest.fromJson(Map<String, dynamic> json) {
    recipeId = json['recipe_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recipe_id'] = recipeId;
    return data;
  }
}