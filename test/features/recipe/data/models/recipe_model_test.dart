import 'dart:convert';

import 'package:cooking/features/recipe/data/models/recipe_model.dart';
import 'package:cooking/features/recipe/domain/entities/recipe.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final ingredients = IngredientsModel("", "", 0.0);
  final steps = StepsModel(1, "", "", "", "");

  final tRecipeModel = RecipeModel(1, "Nutella Pie", 8, "",
      List.filled(1, ingredients), List.filled(1, steps));

  test('should be a subclass of Recipe entity', () async {
    expect(tRecipeModel, isA<Recipe>());
  });

  group('fromJson', () {
    test('should return a valid model', () async {
      //arange
      final Map<String, dynamic> jsonMap = json.decode(fixture('recipe.json'));

      //act
      final result = RecipeModel.fromJson(jsonMap);

      //assert
      expect(result, tRecipeModel);
    });

    test('should return a valid model when Quantity is a int value', () async {
      //arange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('recipe_int.json'));

      //act
      final result = RecipeModel.fromJson(jsonMap);

      //assert
      expect(result, tRecipeModel);
    });
  });
}
