import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:video_player/video_player.dart';

part 'video_recipe_event.dart';
part 'video_recipe_state.dart';

class VideoRecipeBloc extends Bloc<VideoRecipeEvent, VideoRecipeState> {
  VideoRecipeBloc() : super(VideoRecipeLoading());
  late final VideoPlayerController controller;

  @override
  Stream<VideoRecipeState> mapEventToState(
    VideoRecipeEvent event,
  ) async* {
    if (event is GetVideoRecipe) {
      controller = VideoPlayerController.network(
        event.link,
      )..initialize();
      yield VideoRecipeLoaded(
        controller: controller,
      );
    }
  }
}
