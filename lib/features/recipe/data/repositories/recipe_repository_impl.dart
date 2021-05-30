import 'package:cooking/core/error/exceptions.dart';
import 'package:cooking/core/error/failures.dart';
import 'package:cooking/core/network/network_info.dart';
import 'package:cooking/features/recipe/data/datasources/recipe_remote_data_source.dart';
import 'package:cooking/features/recipe/domain/entities/recipe_list.dart';
import 'package:cooking/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:dartz/dartz.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final RecipeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RecipeRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, RecipeList>> getRecipes() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getRecipes());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
