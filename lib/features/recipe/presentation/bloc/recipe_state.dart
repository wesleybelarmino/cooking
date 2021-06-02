part of 'recipe_bloc.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object> get props => [];
}

class Loading extends RecipeState {}

class Loaded extends RecipeState {
  final RecipeList recipeList;
  Loaded({required this.recipeList});
}

class Error extends RecipeState {
  final String message;
  Error({required this.message});
}
