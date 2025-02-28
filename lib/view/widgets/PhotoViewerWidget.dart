import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewerWidget extends StatelessWidget {
  final ImageProvider imageProvider;
  final Color? backgroundColor;

  const PhotoViewerWidget(
      {super.key, required this.imageProvider, this.backgroundColor});

  // Method to show the dialog with the image in PhotoView
  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            // fit: StackFit.passthrough,
            alignment: Alignment.topRight,
            children: [
              PhotoView(
                backgroundDecoration: BoxDecoration(color: Colors.transparent),
                imageProvider: imageProvider,
              ),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    size: 40,
                    Icons.close,
                    color: Colors.white,
                  )),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => _showImageDialog(context), // Show image on tap
        child: Container(
          decoration:
              BoxDecoration(image: DecorationImage(image: imageProvider)),
          // child: Hero(
          //   tag: 'imageHero', // For hero animation (optional)
          //   child: Image.network(imageUrl, width: 200, height: 200),
          // ),
        ),
      ),
    );
  }
}
