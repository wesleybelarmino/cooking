import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  const Recipe(this.id, this.name, this.servings, this.image, this.ingredients,
      this.steps);

  final int id;
  final String name;
  final int servings;
  final String image;
  final List<Ingredients> ingredients;
  final List<Steps> steps;

  @override
  List<Object?> get props => [id, name, servings, image, ingredients, steps];
}

class Ingredients extends Equatable {
  const Ingredients(this.ingredient, this.measure, this.quantity);

  final String ingredient;
  final String measure;
  final double quantity;

  @override
  List<Object?> get props => [ingredient, measure, quantity];

  @override
  String toString() => '$quantity $measure $ingredient';
}

class Steps extends Equatable {
  const Steps(this.id, this.description, this.shortDescription,
      this.thumbnailURL, this.videoURL);

  final int id;
  final String description;
  final String shortDescription;
  final String thumbnailURL;
  final String videoURL;
  String get videoLink => videoURL.isNotEmpty ? videoURL : thumbnailURL;

  @override
  List<Object?> get props =>
      [id, description, shortDescription, thumbnailURL, videoURL];

  @override
  String toString() => '$description';
}
