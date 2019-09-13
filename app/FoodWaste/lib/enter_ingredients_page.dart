import 'package:flutter/material.dart';
import 'package:food_waste/ui/jumbo_ui.dart';

class EnterIngredientsPage extends StatefulWidget {
  EnterIngredientsPage({Key key}) : super(key: key);

  @override
  _EnterIngredientsPageState createState() => _EnterIngredientsPageState();
}

class _EnterIngredientsPageState extends State<EnterIngredientsPage> {
  List<String> _addedIngredients = [];

  void _addIngredient(String ingredient) {
    setState(() {
      _addedIngredients.add(ingredient);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("What\'s in your fridge?"),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    decoration:
                        InputDecoration(helperText: "Enter your ingredient"),
                    style: Theme.of(context).textTheme.body1,
                  ),
                ),
                Flexible(child: MaterialButton(child: Text("Add"))),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          tooltip: 'Increment',
          child: Icon(Icons.add),
          backgroundColor: JumboUI.yellowColor,
        ));
  }
}
