import 'package:flutter/material.dart';
import 'package:food_waste/ui/recipe_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/recipe.dart';

class SearchResultsPage extends StatefulWidget {
  SearchResultsPage({Key key, this.recipes}) : super(key: key);

  List<Recipe> recipes;

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  Future _recipeSelected(Recipe recipe) async {
    print("Selected ${recipe.id} - ${recipe.name}");

    await launch("jumboapp://jumbo.com/recipes?id=${recipe.id}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "What\'s in your fridge?",
          style: TextStyle(
            fontFamily: 'JumboTheSans-Bold',
            fontSize: 16.0,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: widget.recipes == null ? 0 : widget.recipes.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => _recipeSelected(widget.recipes[index]),
              child: RecipeCard(recipe: widget.recipes[index]),
            );
          },
        ),
      ),
    );
  }
}
