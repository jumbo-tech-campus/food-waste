import 'package:flutter/material.dart';
import 'package:food_waste/ui/recipe_widget.dart';

import 'model/recipe.dart';

class SearchResultsPage extends StatefulWidget {
  SearchResultsPage({Key key}) : super(key: key);

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recipes for you"),
        ),
        body: ListView(
          children: <Widget>[
            RecipeWidget(recipe: Recipe.stub),
            RecipeWidget(recipe: Recipe.stub),
            RecipeWidget(recipe: Recipe.stub),
            RecipeWidget(recipe: Recipe.stub),
            RecipeWidget(recipe: Recipe.stub),
            RecipeWidget(recipe: Recipe.stub),
            RecipeWidget(recipe: Recipe.stub),
          ],
        ),
    );
  }
}
