import 'dart:convert';

import 'package:food_waste/model/recipe.dart';
import 'package:http/http.dart' as Http;

class Api {
  static const BaseUrl = 'http://10.65.82.55:3001/recipes';

  Future<List<Recipe>> getRecipes(List<String> terms) async {
    final url = Uri.encodeFull('$BaseUrl?q=${terms.join(',')}');
    print("url: $url");
    final response = await Http.get(url);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      final results = json.decode(response.body) as List;

      return results.map((result) => Recipe.fromJson(result)).toList();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load tdee data');
    }
  }
}
