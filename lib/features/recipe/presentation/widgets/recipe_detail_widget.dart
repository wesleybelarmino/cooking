import 'package:cooking/features/recipe/domain/entities/recipe.dart';
import 'package:cooking/features/recipe/presentation/pages/recipe_video_page.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';

class RecipeDetailWidget extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailWidget(this.recipe);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          _buildRecipeIngredients(context, recipe.ingredients),
          _buildRecipeSetps(context, recipe.steps)
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
            itemBuilder: (_, __) => InkWell(
              child: _buildStepsItems(_, steps[__]),
              onTap: () => Navigator.push(
                _,
                MaterialPageRoute(
                  builder: (context) => RecipeVideoPage(
                    steps[__],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _buildStepsItems(BuildContext context, Steps steps) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(steps.toString()),
              ),
              if (steps.videoLink.isNotEmpty)
                Image.asset(
                  'assets/images/youtube.png',
                  width: 20,
                  height: 20,
                ),
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
