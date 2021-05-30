import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  const Recipe(this.id, this.name, this.servings, this.image, this.ingredients,
      this.stepes);

  final int id;
  final String name;
  final int servings;
  final String image;
  final List<Ingredients> ingredients;
  final List<Steps> stepes;

  @override
  List<Object?> get props => [id, name, servings, image, ingredients, stepes];
}

class Ingredients extends Equatable {
  const Ingredients(this.ingredient, this.measure, this.quantity);

  final String ingredient;
  final String measure;
  final double quantity;

  @override
  List<Object?> get props => [ingredient, measure, quantity];
}

class Steps extends Equatable {
  const Steps(this.id, this.description, this.shortDescription,
      this.thumbnailURL, this.videoURL);

  final int id;
  final String description;
  final String shortDescription;
  final String thumbnailURL;
  final String videoURL;

  @override
  List<Object?> get props =>
      [id, description, shortDescription, thumbnailURL, videoURL];
}
