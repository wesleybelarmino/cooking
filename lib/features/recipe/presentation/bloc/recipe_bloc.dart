import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cooking/core/error/failures.dart';
import 'package:cooking/features/recipe/domain/entities/recipe_list.dart';
import 'package:cooking/features/recipe/domain/usecases/get_recipes.dart';
import 'package:equatable/equatable.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'No Internet Connection';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  GetRecipes recipeUseCase;

  RecipeBloc({required this.recipeUseCase}) : super(Loading());

  @override
  Stream<RecipeState> mapEventToState(
    RecipeEvent event,
  ) async* {
    if (event is GetRecipeList) {
      final result = await recipeUseCase();
      yield result.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (reciplist) => Loaded(recipeList: reciplist));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case ConnectionFailure:
        return CONNECTION_FAILURE_MESSAGE;
      default:
        return "Unexpected error";
    }
  }
}
