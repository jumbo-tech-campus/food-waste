import 'package:flutter/material.dart';
import 'package:food_waste/search_results_page.dart';
import 'package:food_waste/ui/jumbo_ui.dart';

import 'datalayer/api.dart';

class EnterIngredientsPage extends StatefulWidget {
  EnterIngredientsPage({Key key}) : super(key: key);

  @override
  _EnterIngredientsPageState createState() => _EnterIngredientsPageState();
}

class _EnterIngredientsPageState extends State<EnterIngredientsPage> {
  List<String> _addedIngredients = [];

  final editTextController = TextEditingController();

  void _addIngredient(String ingredient) {
    setState(() {
      if (ingredient.length > 1) {
        _addedIngredients.add(ingredient);
        _showConfirmationAlertDialog(ingredient);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Please enter a valid ingridient"),
            );
          },
        );
      }
    });
  }

  void _clearIngredients() {
    setState(() {
      _addedIngredients = [];
    });
  }

  void _clearEditTextArea() {
    editTextController.clear();
  }

  void _showConfirmationAlertDialog(String ingredient) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(ingredient + " added to your list."),
        );
      },
    );
  }

  Future _loadRecipes() async {
    final results = await Api().getRecipes(_addedIngredients);
    final resultsPage = SearchResultsPage(recipes: results);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => resultsPage));

    _clearEditTextArea();
    _clearIngredients();
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        controller: editTextController,
                        onSubmitted: (text) {
                          _addIngredient(text);
                          _clearEditTextArea();
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            helperText: "Enter your ingredient"),
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: MaterialButton(
                      height: 36,
                      minWidth: 44,
                      color: Colors.white,
                      onPressed: () {
                        _addIngredient(editTextController.text);
                        _clearEditTextArea();
                      },
                      child: Text(
                        "Add to list",
                        style: TextStyle(
                          fontFamily: 'JumboTheSans-Bold',
                          fontSize: 14.0,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _addedIngredients.length,
                itemBuilder: (BuildContext ctxt, int Index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _addedIngredients[Index],
                      style: TextStyle(
                        fontFamily: 'JumboTheSans',
                        fontSize: 14.0,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: MaterialButton(
        height: 36,
        minWidth: MediaQuery.of(context).size.width - 32,
        color: JumboUI.yellowColor,
        onPressed: () => _loadRecipes(),
        child: Text(
          "Show me my options",
          style: new TextStyle(
            fontFamily: 'JumboTheSans-Bold',
            fontSize: 14.0,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    editTextController.dispose();
    super.dispose();
  }
}
