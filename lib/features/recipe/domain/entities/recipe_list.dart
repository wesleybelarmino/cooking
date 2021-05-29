import 'recipe.dart';

class RecipeList{
  const RecipeList(this.recipes);

  final List<Recipe> recipes;

  factory RecipeList.fromJson(List<dynamic> json) {
    var recipeList = json.map((i)=>Recipe.fromJson(i)).toList();
    return RecipeList(recipeList);
  }
}