import 'package:cooking/features/recipe/data/models/recipe_list_model.dart';

abstract class RecipeRemoteDataSource {
  Future<RecipeListModel> getRecipes();
}
