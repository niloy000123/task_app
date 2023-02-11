import 'package:flutter/material.dart';
import 'package:task_app/utils/size_config.dart';
import 'package:video_player/video_player.dart';
import '../../../utils/constants.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.image);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenWidth(PADING_2XL_SIZE * 8),
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GestureDetector(
                onTap: () {
                  // press to switch play and pause
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  });
                },
                child: SizedBox(
                  height: double.infinity,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      // video player
                      VideoPlayer(_controller),
                      // video progress bar
                      VideoProgressIndicator(_controller,
                          allowScrubbing: true,
                          colors: const VideoProgressColors(
                            backgroundColor: Colors.redAccent,
                            playedColor: Colors.green,
                            bufferedColor: Colors.purple,
                          ))
                    ],
                  ),
                ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
