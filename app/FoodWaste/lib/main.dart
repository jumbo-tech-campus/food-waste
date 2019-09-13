import 'package:flutter/material.dart';

import 'enter_ingredients_page.dart';
import 'jumbo_ui.dart';

void main() => runApp(FoodWasteApp());

class FoodWasteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: JumboUI.yellowColor,
      ),
      home: EnterIngredientsPage(title: 'What\'s in your fridge?'),
    );
  }
}