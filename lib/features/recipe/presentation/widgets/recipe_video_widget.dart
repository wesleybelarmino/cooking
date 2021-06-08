import 'package:cooking/features/recipe/domain/entities/recipe.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class RecipeVideoWidget extends StatefulWidget {
  final Steps step;

  RecipeVideoWidget({required this.step});

  @override
  _RecipeVideoNetworkState createState() => _RecipeVideoNetworkState(step);
}

class _RecipeVideoNetworkState extends State<RecipeVideoWidget> {
  Steps step;
  late VideoPlayerController _controller;

  _RecipeVideoNetworkState(this.step);

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      step.videoLink,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  _ControlsOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(step.toString()),
          ),
        ],
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller})
      : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
