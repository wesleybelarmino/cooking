import 'package:cooking/features/recipe/domain/entities/recipe.dart';
import 'package:cooking/features/recipe/domain/entities/recipe_list.dart';
import 'package:cooking/features/recipe/presentation/bloc/recipe_bloc.dart';
import 'package:cooking/features/recipe/presentation/pages/recipe_detail_page.dart';
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
      padding: const EdgeInsets.all(5.0),
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
            itemCount: 3,
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100),
    );
  }

  Widget _buildDataList(RecipeList recipeList) {
    return Container(
      child: ListView.builder(
        itemCount: recipeList.recipes.length,
        itemBuilder: (_, __) => InkWell(
          child: _buildDataListItem(_, recipeList.recipes[__]),
          onTap: () => Navigator.push(
            _,
            MaterialPageRoute(
              builder: (context) => RecipeDetailPage(
                recipe: recipeList.recipes[__],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDataListItem(BuildContext context, Recipe recipe) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      height: 240,
      width: 300,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/' +
                    recipe.name.toLowerCase().replaceAll(" ", "") +
                    ".jpg",
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Center(
                    child: Text(
                      recipe.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black54),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
