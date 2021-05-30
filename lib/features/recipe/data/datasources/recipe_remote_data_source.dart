import 'dart:convert';

import 'package:cooking/core/error/exceptions.dart';
import 'package:cooking/features/recipe/data/models/recipe_list_model.dart';
import 'package:http/http.dart' as http;

abstract class RecipeRemoteDataSource {
  Future<RecipeListModel> getRecipes();
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  final http.Client client;

  RecipeRemoteDataSourceImpl({required this.client});

  @override
  Future<RecipeListModel> getRecipes() async {
    final response = await client.get(
      Uri.parse(
          "https://d17h27t6h515a5.cloudfront.net/topher/2017/May/59121517_baking/baking.json"),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return RecipeListModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
