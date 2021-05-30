import 'dart:convert';

import 'package:cooking/features/recipe/data/models/recipe_list_model.dart';
import 'package:cooking/features/recipe/data/models/recipe_model.dart';
import 'package:cooking/features/recipe/domain/entities/recipe_list.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final ingredients = IngredientsModel("", "", 0.0);
  final steps = StepsModel(1, "", "", "", "");

  final recipeModel = RecipeModel(1, "Nutella Pie", 8, "",
      List.filled(1, ingredients), List.filled(1, steps));

  final tRecipeListModel = RecipeListModel(List.filled(1, recipeModel));

  test('should be a subclass of RecipeList entity', () async {
    expect(tRecipeListModel, isA<RecipeList>());
  });

  test('should be return a valid Recipe model', () async {
    //arrange
    final List<dynamic> jsonMap = json.decode(fixture('recipe_list.json'));
    //act
    final result = RecipeListModel.fromJson(jsonMap);
    //assert
    expect(result.recipes[0], tRecipeListModel.recipes[0]);
  });
}
