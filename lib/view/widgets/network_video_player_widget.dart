import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';
import '../../constants/colors_constants.dart';

class NetworkVideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const NetworkVideoPlayerWidget({super.key, required this.videoUrl});

  @override
  _NetworkVideoPlayerWidgetState createState() =>
      _NetworkVideoPlayerWidgetState();
}

class _NetworkVideoPlayerWidgetState extends State<NetworkVideoPlayerWidget> {
  late VideoPlayerController _videoPlayercontroller;
  late ChewieController _chewieController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;

    _videoPlayercontroller =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize().then((_) {
            setState(() {
              isLoading = false;
            });
          });
    _chewieController = ChewieController(
      allowPlaybackSpeedChanging: false,
      videoPlayerController: _videoPlayercontroller,
      autoPlay: false,
      looping: false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayercontroller.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      color: AppColors.kBerkeleyBlue,
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Scaffold(
              backgroundColor: AppColors.kBerkeleyBlue,
              body: Chewie(
                controller: _chewieController,
              ),
            ),
    );
  }
}
