import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/recipe_list.dart';
import '../repositories/recipe_repository.dart';

class GetRecipes {
  const GetRecipes(this.repository);

  final RecipeRepository repository;

  Future<Either<Failure, RecipeList>> call() async {
    return await repository.getRecipes();
  }
}
