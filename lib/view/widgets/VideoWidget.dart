import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_thumbnail_video/index.dart';
import 'package:get_thumbnail_video/video_thumbnail.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';

class VideoThumbnailWidget extends StatelessWidget {
  final String videoPath;

  const VideoThumbnailWidget({super.key, required this.videoPath});

  Future<String> getThumbnail(String videoPath) async {
    // Generate thumbnail logic here
    final uint8List = await VideoThumbnail.thumbnailData(
      video: videoPath,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 200,
      quality: 75,
    );

    final tempDir = await getTemporaryDirectory();
    final filePath = '${tempDir.path}/thumbnail.jpg';
    final file = File(filePath);
    await file.writeAsBytes(uint8List);
    return filePath;
  }

  // Show the video popup (Dialog)
  void showVideoDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allows dismissing dialog by tapping outside
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.black,
          child: VideoPlayerScreen(videoPath: videoPath),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // When thumbnail is tapped, show the video player in a dialog
        showVideoDialog(context);
      },
      child: FutureBuilder<String>(
        future: getThumbnail(videoPath),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error generating thumbnail'));
            }

            // Load the thumbnail from the file path
            File thumbnailFile = File(snapshot.data ?? '');

            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(thumbnailFile),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Icon(
                  Icons.play_circle_fill,
                  size: 50,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            );
          } else {
            return CircularProgressIndicator(); // Loading state
          }
        },
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;

  const VideoPlayerScreen({super.key, required this.videoPath});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        setState(() {
          _isPlaying = true;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
              IconButton(
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 50,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    if (_isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                    _isPlaying = !_isPlaying;
                  });
                },
              ),
            ],
          )
        : Center(child: CircularProgressIndicator());
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
