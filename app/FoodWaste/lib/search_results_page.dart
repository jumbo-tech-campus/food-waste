import 'package:flutter/material.dart';
import 'package:food_waste/ui/recipe_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/recipe.dart';

class SearchResultsPage extends StatefulWidget {
  SearchResultsPage({Key key}) : super(key: key);

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {

  List<Recipe> recipes = [
    Recipe.stub,
    Recipe.stub,
    Recipe.stub,
    Recipe.stub,
    Recipe.stub,
    Recipe.stub,
  ];

  Future _recipeSelected(Recipe recipe) async {
    print("${recipe.id} - ${recipe.name}");

    String url = "jumboapp://jumbo.com/recipes?id=${recipe.id}";
//    if (await canLaunch(url)) {
    print("JumboApp: $url");
      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recipes for you"),
        ),
        body: ListView.builder(
            itemCount: recipes == null ? 0 : recipes.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => _recipeSelected(recipes[index]),
                child: RecipeCard(recipe: recipes[index]),
              );
            }),
    );
  }
}
