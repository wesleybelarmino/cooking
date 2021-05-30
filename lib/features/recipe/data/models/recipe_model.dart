import 'package:cooking/features/recipe/domain/entities/recipe.dart';

class RecipeModel extends Recipe {
  RecipeModel(int id, String name, int servings, String image,
      List<IngredientsModel> ingredients, List<StepsModel> stepes)
      : super(id, name, servings, image, ingredients, stepes);

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    //parse list of ingredients
    var ingrediestList = json['ingredients'] as List;
    List<IngredientsModel> ingredients =
        ingrediestList.map((i) => IngredientsModel.fromJson(i)).toList();
    // parse list of steps
    var stepsList = json['steps'] as List;
    List<StepsModel> stepes =
        stepsList.map((i) => StepsModel.fromJson(i)).toList();

    return RecipeModel(json['id'], json['name'], json['servings'],
        json['image'], ingredients, stepes);
  }
}

class IngredientsModel extends Ingredients {
  IngredientsModel(String ingredient, String measure, double quantity)
      : super(ingredient, measure, quantity);

  factory IngredientsModel.fromJson(Map<String, dynamic> json) {
    return IngredientsModel(json['ingredient'], json['measure'],
        (json['quantity'] as num).toDouble());
  }
}

class StepsModel extends Steps {
  StepsModel(int id, String description, String shortDescription,
      String thumbnailURL, String videoURL)
      : super(id, description, shortDescription, thumbnailURL, videoURL);

  factory StepsModel.fromJson(Map<String, dynamic> json) {
    return StepsModel(json['id'], json['description'], json['shortDescription'],
        json['thumbnailURL'], json['videoURL']);
  }
}
