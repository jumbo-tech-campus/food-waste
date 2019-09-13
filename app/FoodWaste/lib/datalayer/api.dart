import 'dart:convert';

import 'package:http/http.dart' as Http;

class Api {
  static const BaseUrl = 'https://internal.test.cloud.jumbo.com/v1/foodcoach/calorie-calculation';
//  static const BaseUrl = 'https://mobileapi.jumbo.com/v5/foodcoach/calorie-calculation';

  Future<List<CalculationApiResult>> getTdeeCalculation(String height, String weight, List<String> ageRange, String gender) async {
    final url = '$BaseUrl/tdee?heightInCm=$height&weightInKg=$weight&gender=$gender&ageRange=${ageRange.first}&ageRange=${ageRange.last}';
    print("url: $url");
    final response = await Http.get(url);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      final results = json.decode(response.body) as List;

      return results.map((result) =>
      new CalculationApiResult.fromJson(result)
      ).toList();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load tdee data');
    }
  }
}

class CalculationApiResult {
  final String mealType;
  final CalculationResult low;
  final CalculationResult high;

  CalculationApiResult({
    this.mealType,
    this.low,
    this.high
  });

  factory CalculationApiResult.fromJson(Map<String, dynamic> json) {
    return CalculationApiResult(
        mealType: json['mealType'],
        low: CalculationResult.fromJson(json['low']),
        high: CalculationResult.fromJson(json['high'])
    );
  }
}

class CalculationResult {
  final int calories;
  final MacroDistribution macroGrams;

  CalculationResult({
    this.calories,
    this.macroGrams
  });

  factory CalculationResult.fromJson(Map<String, dynamic> json) {
    return CalculationResult(
        calories: json['calories'],
        macroGrams: MacroDistribution.fromJson(json['macroGrams'])
    );
  }
}

class MacroDistribution {
  final int carbohydrates;
  final int proteins;
  final int fats;

  MacroDistribution({
    this.carbohydrates,
    this.proteins,
    this.fats
  });

  factory MacroDistribution.fromJson(Map<String, dynamic> json) {
    return MacroDistribution(
      carbohydrates: json['carbohydrates'],
      proteins: json['proteins'],
      fats: json['fats'],
    );
  }
}