import 'package:cooking/features/recipe/domain/entities/recipe.dart';
import 'package:cooking/features/recipe/presentation/widgets/recipe_detail_widget.dart';
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
        child: RecipeDetailWidget(recipe),
      ),
    );
  }
}
