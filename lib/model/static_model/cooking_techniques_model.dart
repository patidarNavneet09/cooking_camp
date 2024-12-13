import 'package:cooking_champs/constant/assets_path.dart';

class CookingTechniquesModel {
  final String title;
  final String description;
  final String image; // New key for image path or URL

  CookingTechniquesModel({
    required this.title,
    required this.description,
    required this.image,
  });
}
  // Method to create a list of techniques from raw data
   List<CookingTechniquesModel> getCookingTechniques() {
    return [
      CookingTechniquesModel(
        title: "Sift",
        description:
        "To sift use your sieve to get rid of lumps in flour or icing sugar. Place your sieve over a bowl that is larger than the sieve. Gently tap the side of the sieve until all the flour has passed through. Press any remaining lumps through with a spoon.",
        image:AssetsPath.cookingTechniquesImg1, // Replace with actual image path
      ),
      CookingTechniquesModel(
        title: "Whisk",
        description:
        "Use your whisk. If you don’t have a whisk you can use a fork. With your whisk or fork you stir your ingredients quickly. The whisk liquid ingredients to combine them. Whisking adds air and makes our mixture lighter.",
        image:AssetsPath.cookingTechniquesImg2,
      ),
      CookingTechniquesModel(
        title: "Chop and Dice",
        description: "When you cut into small even pieces.",
        image:AssetsPath.cookingTechniquesImg3,
      ),
      CookingTechniquesModel(
        title: "Slice",
        description: "To cut ingredients into slices.",
        image:AssetsPath.cookingTechniquesImg4,
      ),
      CookingTechniquesModel(
        title: "Boiling",
        description:
        "This is when a liquid gets very hot and the bubbles in the liquid get larger and pop on the surface.",
        image:AssetsPath.cookingTechniquesImg5,
      ),
      CookingTechniquesModel(
        title: "Simmer",
        description:
        "This is when small bubbles appear in your liquid but do not burst. This happens when you have turned the heat off or turn the heat down after the liquid has come to the boil.",
        image:AssetsPath.cookingTechniquesImg6,
      ),
    ];
  }