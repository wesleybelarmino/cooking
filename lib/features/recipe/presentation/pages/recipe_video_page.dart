import 'package:cooking/features/recipe/domain/entities/recipe.dart';
import 'package:cooking/features/recipe/presentation/widgets/recipe_video_widget.dart';
import 'package:flutter/material.dart';

class RecipeVideoPage extends StatelessWidget {
  final Steps step;

  const RecipeVideoPage(this.step);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          step.shortDescription,
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: RecipeVideoWidget(
        step: step,
      ),
    );
  }
}
