import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cooking/core/error/failures.dart';
import 'package:cooking/features/recipe/domain/entities/recipe_list.dart';
import 'package:cooking/features/recipe/domain/usecases/get_recipes.dart';
import 'package:equatable/equatable.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  GetRecipes recipeUseCase;

  RecipeBloc({required this.recipeUseCase}) : super(Loading());

  @override
  Stream<RecipeState> mapEventToState(
    RecipeEvent event,
  ) async* {
    if (event is GetRecipeList) {
      final result = await recipeUseCase();
      yield result.fold((failure) => Error(message: failure.failureMessage),
          (reciplist) => Loaded(recipeList: reciplist));
    }
  }
}
