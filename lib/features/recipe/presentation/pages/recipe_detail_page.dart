import 'package:cooking/features/recipe/domain/entities/recipe.dart';
import 'package:cooking/main.dart';
import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailPage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipe.name,
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _buildRecipeDetail(context, recipe),
      ),
    );
  }

  Widget _buildRecipeDetail(BuildContext context, Recipe recipe) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          _buildRecipeIngredients(context, recipe.ingredients),
          _buildRecipeSetps(context, recipe.stepes)
        ],
      ),
    );
  }

  Widget _buildRecipeIngredients(
      BuildContext context, List<Ingredients> ingredients) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Ingredients",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: PrimaryColor),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ingredients[index].toString()),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                );
              }),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeSetps(BuildContext context, List<Steps> steps) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Steps",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: PrimaryColor),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: steps.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(steps[index].toString()),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                );
              }),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
