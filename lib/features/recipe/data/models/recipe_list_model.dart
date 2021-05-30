import 'package:cooking/features/recipe/data/models/recipe_model.dart';
import 'package:cooking/features/recipe/domain/entities/recipe_list.dart';

class RecipeListModel extends RecipeList {
  RecipeListModel(List<RecipeModel> recipes) : super(recipes);

  factory RecipeListModel.fromJson(List<dynamic> json) {
    var recipeList = json.map((i) => RecipeModel.fromJson(i)).toList();
    return RecipeListModel(recipeList);
  }
}
