import 'package:cooking/core/network/network_info.dart';
import 'package:cooking/features/recipe/data/repositories/recipe_repository_impl.dart';
import 'package:cooking/features/recipe/presentation/bloc/recipe/recipe_bloc.dart';
import 'package:cooking/features/recipe/presentation/bloc/video/video_recipe_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'features/recipe/data/datasources/recipe_remote_data_source.dart';
import 'features/recipe/domain/repositories/recipe_repository.dart';
import 'features/recipe/domain/usecases/get_recipes.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void init() {
  //! Features  Recipes
  // Block
  sl.registerFactory(() => RecipeBloc(recipeUseCase: sl()));
  sl.registerFactory(() => VideoRecipeBloc());

  // Use case
  sl.registerLazySingleton(() => GetRecipes(sl()));

  // Repository
  sl.registerLazySingleton<RecipeRepository>(
      () => RecipeRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // Data sources
  sl.registerLazySingleton<RecipeRemoteDataSource>(
      () => RecipeRemoteDataSourceImpl(client: sl()));

  //! Core
  // Network info
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
