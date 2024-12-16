import 'package:cooking_champs/constant/assets_path.dart';

class FoodModel {
  final String name;
  final String imagePath;
  bool isBitter;
  bool isSour;
  bool isSweet;

  FoodModel({
    required this.name,
    required this.imagePath,
    this.isBitter = false,
    this.isSour = false,
    this.isSweet = false,
  });
}

 List<FoodModel> foodModels(){
  return  [
    FoodModel(name: 'Lemon', imagePath:AssetsPath.lemon),
    FoodModel(name: 'Honey', imagePath:AssetsPath.honey),
    FoodModel(name: 'Orange', imagePath:AssetsPath.orange),
    FoodModel(name: 'Apple', imagePath:AssetsPath.apple),
    FoodModel(name: 'Milk', imagePath:AssetsPath.milk),
    FoodModel(name: 'Banana', imagePath:AssetsPath.banana),
    FoodModel(name: 'Chocolate', imagePath:AssetsPath.chocolate),
  ];
 }