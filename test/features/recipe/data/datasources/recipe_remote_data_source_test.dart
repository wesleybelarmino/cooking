import 'dart:convert';

import 'package:cooking/core/error/exceptions.dart';
import 'package:cooking/features/recipe/data/datasources/recipe_remote_data_source.dart';
import 'package:cooking/features/recipe/data/models/recipe_list_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'recipe_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  const url =
      "https://d17h27t6h515a5.cloudfront.net/topher/2017/May/59121517_baking/baking.json";
  MockClient mockClient = MockClient();
  RecipeRemoteDataSourceImpl dataSourceImpl =
      RecipeRemoteDataSourceImpl(client: mockClient);

  void setUpMockHttpClientSuccess200() {
    when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(fixture('recipe_list.json'), 200),
    );
  }

  group('getRecipes', () {
    final tRecipeListModel =
        RecipeListModel.fromJson(json.decode(fixture("recipe_list.json")));

    test('should perform a GET request on a URL', () async {
      // arrange
      setUpMockHttpClientSuccess200();
      //act
      dataSourceImpl.getRecipes();
      //assert
      verify(mockClient.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test('should return RecipeList when the response cod is 200', () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      final result = await dataSourceImpl.getRecipes();

      // assert
      expect(result.recipes[0], equals(tRecipeListModel.recipes[0]));
    });
    test('should throw a ServerException when the response code not is 200',
        () async {
      //arrange
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async =>
              Future.value(http.Response('Something went swrong', 404)));
      //act
      final call = dataSourceImpl.getRecipes();

      // assert
      expect(() => call, throwsA(TypeMatcher<ServerException>()));
    });
  });
}
