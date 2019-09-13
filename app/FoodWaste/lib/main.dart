import 'package:flutter/material.dart';
import 'package:food_waste/search_results_page.dart';

import 'enter_ingredients_page.dart';
import 'package:food_waste/ui/jumbo_ui.dart';

void main() => runApp(FoodWasteApp());

class FoodWasteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: JumboUI.yellowColor,
      ),
      home: EnterIngredientsPage(),
    );
  }
}