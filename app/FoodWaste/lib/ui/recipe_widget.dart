import 'package:flutter/material.dart';
import 'package:food_waste/model/recipe.dart';

class RecipeWidget extends StatelessWidget {
  RecipeWidget({Key key, Recipe recipe})
      : this.recipe = recipe,
        super(key: key);

  Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: SizedBox(
              child: Image.network(recipe.imageUrl), width: 90, height: 90),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Container(
            width: 300,
            child: Text(
              recipe.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          ),
          Row(children: <Widget>[
            Image.asset("assets/ic_time.png", width: 24, height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Text("${recipe.numberOfPortions} portions"),
            ),
            Image.asset("assets/ic_person.png", width: 24, height: 24),
            Text("${recipe.cookingTime} min"),
          ])
        ])
      ]),
    );
  }
}
