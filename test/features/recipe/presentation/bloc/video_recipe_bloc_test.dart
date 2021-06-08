import 'package:bloc_test/bloc_test.dart';
import 'package:cooking/features/recipe/presentation/bloc/video/video_recipe_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:video_player/video_player.dart';

import 'video_recipe_bloc_test.mocks.dart';

@GenerateMocks([VideoPlayerController])
void main() {
  const videoLink =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";
  MockVideoPlayerController mockVideoPlayerController =
      MockVideoPlayerController();

  test('Block Video initial state should be loading', () {
    // assert
    expect(VideoRecipeBloc().state, equals(VideoRecipeLoading()));
  });
  group('LoadVideoRecipe', () {
    blocTest(
      'emits loaded video',
      build: () => VideoRecipeBloc(),
      act: (bloc) => cast<VideoRecipeBloc>(bloc).add(GetVideoRecipe(videoLink)),
      expect: () => [VideoRecipeLoaded(controller: mockVideoPlayerController)],
    );
  });
}
