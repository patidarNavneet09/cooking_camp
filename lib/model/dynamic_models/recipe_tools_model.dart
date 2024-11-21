class RecipeToolsModel {
  String? id;
  String? toolName;
  String? toolImage;
  String? createdAt;
  String? updatedAt;

  RecipeToolsModel(
      {this.id, this.toolName, this.toolImage, this.createdAt, this.updatedAt});

  RecipeToolsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    toolName = json['tool_name'];
    toolImage = json['tool_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tool_name'] = toolName;
    data['tool_image'] = toolImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}