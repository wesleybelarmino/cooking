import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:cooking/core/error/failures.dart';
import 'package:cooking/features/recipe/data/models/recipe_list_model.dart';
import 'package:cooking/features/recipe/domain/usecases/get_recipes.dart';
import 'package:cooking/features/recipe/presentation/bloc/recipe/recipe_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockGetRecipes extends Mock implements GetRecipes {}

void main() {
  MockGetRecipes mockGetRecipes = MockGetRecipes();

  test('Block initial state should be loading', () {
    // assert
    expect(RecipeBloc(recipeUseCase: mockGetRecipes).state, equals(Loading()));
  });

  group('GetRecipes', () {
    final tRecipeList =
        RecipeListModel.fromJson(json.decode(fixture("recipe_list.json")));
    blocTest(
      'emits [Loaded] when successful',
      build: () {
        when(() => mockGetRecipes())
            .thenAnswer((_) async => Right(tRecipeList));
        return RecipeBloc(recipeUseCase: mockGetRecipes);
      },
      act: (bloc) => cast<RecipeBloc>(bloc).add(GetRecipeList()),
      expect: () => [Loaded(recipeList: tRecipeList)],
    );
    blocTest(
      'emits [Error] when getting data fails',
      build: () {
        when(() => mockGetRecipes())
            .thenAnswer((_) async => Left(ServerFailure()));
        return RecipeBloc(recipeUseCase: mockGetRecipes);
      },
      act: (bloc) => cast<RecipeBloc>(bloc).add(GetRecipeList()),
      expect: () => [Error(message: SERVER_FAILURE_MESSAGE)],
    );

    blocTest(
      'emits [Error] when connection fails',
      build: () {
        when(() => mockGetRecipes())
            .thenAnswer((_) async => Left(ConnectionFailure()));
        return RecipeBloc(recipeUseCase: mockGetRecipes);
      },
      act: (bloc) => cast<RecipeBloc>(bloc).add(GetRecipeList()),
      expect: () => [Error(message: CONNECTION_FAILURE_MESSAGE)],
    );
  });
}
