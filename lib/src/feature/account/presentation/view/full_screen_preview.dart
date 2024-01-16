import 'dart:io';

import 'package:flutter/material.dart';

class FullScreenPreview extends StatelessWidget {
  final File file;
  final bool isVideo;
  final VoidCallback onSave;

  FullScreenPreview(
      {required this.file, this.isVideo = false, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: onSave,
          ),
        ],
      ),
      body: Center(
        child:
            // isVideo
            //     ? VideoPlayerController.file(file).value.isInitialized
            //         ? AspectRatio(
            //             aspectRatio: VideoPlayerController.file(file).value.aspectRatio,
            //             child: VideoPlayer(VideoPlayerController.file(file)),
            //           )
            //         : CircularProgressIndicator()
            //     :
            Image.file(file),
      ),
    );
  }
}
