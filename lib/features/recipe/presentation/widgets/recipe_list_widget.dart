import 'package:cooking/features/recipe/domain/entities/recipe.dart';
import 'package:cooking/features/recipe/domain/entities/recipe_list.dart';
import 'package:cooking/features/recipe/presentation/bloc/recipe_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecipeListWidget extends StatelessWidget {
  final RecipeState state;
  const RecipeListWidget(this.state);
  @override
  Widget build(BuildContext context) {
    if (state is Loading) {
      return _buildShimmerList();
    } else if (state is Loaded) {
      return _buildDataList((state as Loaded).recipeList);
    }
    return Container();
  }

  Widget _buildShimmerList() {
    return Container(
      child: Shimmer.fromColors(
          child: ListView.builder(
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 2,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(_).size.width,
                      height: 200,
                    )
                  ],
                ),
              ),
            ),
            itemCount: 6,
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100),
    );
  }

  Widget _buildDataList(RecipeList recipeList) {
    return Container(
      child: ListView.builder(
          itemBuilder: (context, index) =>
              _buildDataListItem(recipeList.recipes[index])),
    );
  }

  Widget _buildDataListItem(Recipe recipe) {
    return Container();
  }
}
