import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  const Recipe(this. id, this.name, this. servings, this.image, this.ingredients, this.stepes);

  final int id;
  final String name;
  final int servings;
  final String image;
  final List<Ingredients> ingredients;
  final List<Steps> stepes;

  @override
  List<Object?> get props => [id, name, servings, image, ingredients, stepes];
  
  factory Recipe.fromJson(Map<String, dynamic> json) {
    //parse list of ingredients
    var ingrediestList = json['ingredients'] as List;
    List<Ingredients> ingredients = ingrediestList.map((i) => Ingredients.fromJson(i)).toList();
    // parse list of steps
    var stepsList = json['steps'];
    List<Steps> stepes = stepsList.map((i) => Steps.fromJson(i)).toList();

    return Recipe(json['id'], json['name'], json['servings'], json['image'], ingredients, stepes);
  }
}

class Ingredients{
  const Ingredients(this.ingredient, this.measure, this.quantity);

  final String ingredient;
  final String measure;
  final double quantity;


  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(json['ingredient'], json['measure'], json['quantity']);
  }  
}

class Steps{
  const Steps(this.id, this.description, this.shortDescription, this.thumbnailURL, this.videoURL);
  
  final int id;
  final String description;
  final String shortDescription;
  final String thumbnailURL;
  final String videoURL;

  factory Steps.fromJson(Map<String, dynamic> json) {
    return Steps(json['id'], json['description'], json['shortDescription'], json['thumbnailURL'], json['videoURL']);
  }
}