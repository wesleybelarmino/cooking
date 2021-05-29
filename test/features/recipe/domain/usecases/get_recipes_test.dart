import 'package:cooking/features/recipe/domain/entities/recipe.dart';
import 'package:cooking/features/recipe/domain/entities/recipe_list.dart';
import 'package:cooking/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:cooking/features/recipe/domain/usecases/get_recipes.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_recipes_test.mocks.dart';


@GenerateMocks([RecipeRepository])
void main() {
  final mockRecipeRepository = MockRecipeRepository();
  final usecases = GetRecipes(mockRecipeRepository);

  final ingredients = Ingredients("", "", 0.0);
  final steps = Steps(1, "", "", "", "");
  final recipe = Recipe(1, "Nutella Pie", 8, "", List.filled(1, ingredients), List.filled(1, steps));
  final listOfRecipe = List.filled(1, recipe);
  final recipeList = RecipeList(listOfRecipe);

  test(
    'should get recipe list from the repository',
    () async {
      //arrange
        when(mockRecipeRepository.getRecipes())
        .thenAnswer((_) async => Right(recipeList));
      //act
        final result = await usecases();
      //assert
        expect(result, Right(recipeList));
        verify(mockRecipeRepository.getRecipes());
        verifyNoMoreInteractions(mockRecipeRepository);
    }
  );
  

}