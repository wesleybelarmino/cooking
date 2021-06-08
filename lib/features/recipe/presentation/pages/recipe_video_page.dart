import 'package:cooking/features/recipe/domain/entities/recipe.dart';
import 'package:cooking/features/recipe/presentation/bloc/video/video_recipe_bloc.dart';
import 'package:cooking/features/recipe/presentation/widgets/recipe_video_widget.dart';
import 'package:cooking/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: buildBody(context, step.videoLink),
    );
  }

  BlocProvider<VideoRecipeBloc> buildBody(BuildContext context, String link) {
    return BlocProvider(
      create: (_) => sl<VideoRecipeBloc>()..add(GetVideoRecipe(link)),
      child: Container(
        child: BlocBuilder<VideoRecipeBloc, VideoRecipeState>(
          builder: (context, state) {
            return RecipeVideoWidget(state);
          },
        ),
      ),
    );
  }
}
