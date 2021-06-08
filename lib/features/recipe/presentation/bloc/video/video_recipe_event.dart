part of 'video_recipe_bloc.dart';

abstract class VideoRecipeEvent extends Equatable {
  const VideoRecipeEvent();

  @override
  List<Object> get props => [];
}

class GetVideoRecipe extends VideoRecipeEvent {
  final String link;
  GetVideoRecipe(this.link);
}
