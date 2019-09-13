import 'package:flutter/material.dart';
import 'package:food_waste/ui/jumbo_ui.dart';

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
      _addedIngredients.add(ingredient);
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
          // Retrieve the text the that user has entered by using the
          // TextEditingController.
          content: Text(
              ingredient + " added to your list."),
        );
      },
    );
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
                    controller: editTextController,
                    onSubmitted: (text) {
                      _addIngredient(text);  // Append Text to the list
                      _clearEditTextArea();     // Clear the Text area
                      setState(() {});   // Redraw the Stateful Widget
                    },
                    decoration:
                        InputDecoration(helperText: "Enter your ingredient"),
                    style: Theme.of(context).textTheme.body1,
                  ),
                ),
                Flexible(
                    child: MaterialButton(
                  child: Text("Add to list"),
                  onPressed: () {
                    _showConfirmationAlertDialog(editTextController.text);
                    _addIngredient(editTextController.text);
                    _clearEditTextArea();
                  },
                )),
              ],
            ),
            new Expanded(
                child: new ListView.builder
                  (
                    itemCount: _addedIngredients.length,
                    itemBuilder: (BuildContext ctxt, int Index) {
                      return new Text(_addedIngredients[Index]);
                    }
                )
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showConfirmationAlertDialog(editTextController.text);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
          backgroundColor: JumboUI.yellowColor,
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    editTextController.dispose();
    super.dispose();
  }
}
