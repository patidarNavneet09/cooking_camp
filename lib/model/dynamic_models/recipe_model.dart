import 'package:cooking_champs/model/dynamic_models/user_identity_model.dart';
import 'package:flutter/material.dart';

class RecipeModel {
  String? userId;
  String? name;
  String? bannerImage;
  List<RecipeTools>? recipeTools;
  String? updatedAt;
  String? createdAt;
  String? id;
  List<RecipeIngredient>? recipeIngredient;
  List<RecipeSteps>? recipeSteps;
  String? status;
  Color? color;
  String? isFavourite;
  UserIdentityModel? recipeAddedBy;



  RecipeModel(
      {this.userId,
        this.name,
        this.bannerImage,
        this.recipeTools,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.status,
        this.recipeIngredient,
        this.recipeSteps,this.color,this.isFavourite,this.recipeAddedBy});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'].toString();
    name = json['name'];
    bannerImage = json['banner_image'];
    if (json['recipe_tools'] != null) {
      recipeTools = <RecipeTools>[];
      json['recipe_tools'].forEach((v) {
        recipeTools!.add(RecipeTools.fromJson(v));
      });
    }
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'].toString();
    status = json['status'].toString();
    isFavourite = json['is_favourite'];
    if (json['recipe_ingredient'] != null) {
      recipeIngredient = <RecipeIngredient>[];
      json['recipe_ingredient'].forEach((v) {
        recipeIngredient!.add(RecipeIngredient.fromJson(v));
      });
    }
    if (json['recipe_steps'] != null) {
      recipeSteps = <RecipeSteps>[];
      json['recipe_steps'].forEach((v) {
        recipeSteps!.add(RecipeSteps.fromJson(v));
      });
    }
    recipeAddedBy = json['recipe_added_by'] != null
        ? UserIdentityModel.fromJson(json['recipe_added_by'])
        : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['name'] = name;
    data['banner_image'] = bannerImage;
    if (recipeTools != null) {
      data['recipe_tools'] = recipeTools!.map((v) => v.toJson()).toList();
    }
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['status'] = status;
    data['is_favourite'] = isFavourite;
    if (recipeIngredient != null) {
      data['recipe_ingredient'] =
          recipeIngredient!.map((v) => v.toJson()).toList();
    }
    if (recipeSteps != null) {
      data['recipe_steps'] = recipeSteps!.map((v) => v.toJson()).toList();
    }
    if (recipeAddedBy != null) {
      data['recipe_added_by'] = recipeAddedBy!.toJson();
    }
    return data;
  }
}
class RecipeIngredient {
  String? id;
  String? recipeId;
  String? name;
  String? createdAt;
  String? updatedAt;

  RecipeIngredient(
      {this.id, this.recipeId, this.name, this.createdAt, this.updatedAt});

  RecipeIngredient.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    recipeId = json['recipe_id'].toString();
    name = json['name'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['recipe_id'] = recipeId;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
class RecipeTools {
  String? id;
  String? toolName;
  String? toolImage;
  String? createdAt;
  String? updatedAt;

  RecipeTools(
      {this.id, this.toolName, this.toolImage, this.createdAt, this.updatedAt});

  RecipeTools.fromJson(Map<String, dynamic> json) {
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

class RecipeSteps {
  String? id;
  String? recipeId;
  String? name;
  String? createdAt;
  String? updatedAt;

  RecipeSteps(
      {this.id, this.recipeId, this.name, this.createdAt, this.updatedAt});

  RecipeSteps.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    recipeId = json['recipe_id'].toString();
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['recipe_id'] = recipeId;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}


class RecipeAddedBy {
  String? id;
  String? firstName;
  String? lastName;
  String? role;
  String? email;
  String? image;
  String? createdAt;
  String? updatedAt;

  RecipeAddedBy(
      {this.id,
        this.firstName,
        this.lastName,
        this.role,
        this.email,
        this.image,
        this.createdAt,
        this.updatedAt});

  RecipeAddedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    role = json['role'];
    email = json['email'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['role'] = role;
    data['email'] = email;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}