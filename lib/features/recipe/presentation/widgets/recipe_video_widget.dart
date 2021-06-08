import 'package:cooking/features/recipe/presentation/bloc/video/video_recipe_bloc.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class RecipeVideoWidget extends StatelessWidget {
  final VideoRecipeState videoState;
  late final VideoPlayerController controller;

  RecipeVideoWidget(this.videoState);
  @override
  Widget build(BuildContext context) {
    if (videoState is VideoRecipeLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (videoState is VideoRecipeLoaded) {
      controller = (videoState as VideoRecipeLoaded).controller;
      controller.setLooping(true);
      controller.play();
      return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        // Use the VideoPlayer widget to display the video.
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            VideoPlayer(controller),
            VideoProgressIndicator(controller, allowScrubbing: true),
          ],
        ),
      );
    }
    return Container();
  }
}
