import 'dart:convert';

import 'package:cooking/core/error/exceptions.dart';
import 'package:cooking/core/error/failures.dart';
import 'package:cooking/core/network/network_info.dart';
import 'package:cooking/features/recipe/data/datasources/recipe_remote_data_source.dart';
import 'package:cooking/features/recipe/data/models/recipe_list_model.dart';
import 'package:cooking/features/recipe/data/models/recipe_model.dart';
import 'package:cooking/features/recipe/data/repositories/recipe_repository_impl.dart';
import 'package:cooking/features/recipe/domain/entities/recipe_list.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'recipe_repository_impl_test.mocks.dart';

@GenerateMocks([RecipeRemoteDataSource, NetworkInfo])
void main() {
  MockRecipeRemoteDataSource mockRecipeRemoteDataSource =
      MockRecipeRemoteDataSource();
  MockNetworkInfo mockNetworkInfo = MockNetworkInfo();
  RecipeRepositoryImpl repositoryImpl = RecipeRepositoryImpl(
      remoteDataSource: mockRecipeRemoteDataSource,
      networkInfo: mockNetworkInfo);

  group('getRecipes', () {
    final tRecipeListModel =
        RecipeListModel.fromJson(json.decode(fixture("recipe_list.json")));
    final RecipeList tRecipeList = tRecipeListModel;

    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      //act
      when(mockRecipeRemoteDataSource.getRecipes())
          .thenAnswer((_) async => tRecipeListModel);
      repositoryImpl.getRecipes();
      //assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test('should return remote data source', () async {
        //arrange
        when(mockRecipeRemoteDataSource.getRecipes())
            .thenAnswer((_) async => tRecipeListModel);
        //action
        final result = await repositoryImpl.getRecipes();
        //assert
        verify(mockRecipeRemoteDataSource.getRecipes());
        expect(result, equals(Right(tRecipeList)));
      });

      test('should return server failure when remote data is unsuccessful',
          () async {
        //arrange
        when(mockRecipeRemoteDataSource.getRecipes())
            .thenThrow(ServerException());
        //action
        final result = await repositoryImpl.getRecipes();
        //assert
        verify(mockRecipeRemoteDataSource.getRecipes());
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      test('should return connection failure', () async {
        final result = await repositoryImpl.getRecipes();
        expect(result, equals(Left(ConnectionFailure())));
      });
    });
  });
}
