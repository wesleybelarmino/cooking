part of 'video_recipe_bloc.dart';

abstract class VideoRecipeState extends Equatable {
  const VideoRecipeState();

  @override
  List<Object> get props => [];
}

class VideoRecipeLoading extends VideoRecipeState {}

class VideoRecipeLoaded extends VideoRecipeState {
  final VideoPlayerController controller;
  VideoRecipeLoaded({required this.controller});
}
