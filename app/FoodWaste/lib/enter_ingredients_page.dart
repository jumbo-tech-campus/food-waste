import 'package:flutter/material.dart';

import 'jumbo_ui.dart';

class EnterIngredientsPage extends StatefulWidget {
  EnterIngredientsPage({Key key, this.title}) : super(key: key);

  final String title;

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
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {

          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
          backgroundColor: JumboUI.yellowColor,
        )
    );
  }
}
