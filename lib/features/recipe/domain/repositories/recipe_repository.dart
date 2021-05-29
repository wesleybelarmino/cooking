import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/recipe_list.dart';

abstract class RecipeRepository {
  Future<Either<Failure, RecipeList>> getRecipes();
}