import 'package:cooking_champs/views/recipe/recipe_list_view.dart';
import 'package:flutter/material.dart';

class SaveView extends StatefulWidget {
  const SaveView({super.key});

  @override
  State<SaveView> createState() => _SaveViewState();
}

class _SaveViewState extends State<SaveView> {
  var favourite = 0;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RecipeListView(pageType: 'Favorite',)

    );
  }
}
