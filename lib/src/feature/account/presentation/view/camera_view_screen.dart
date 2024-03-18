import 'dart:io';

import 'package:camera/camera.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';
import 'package:path_provider/path_provider.dart';

class CameraViewScreen extends StatefulWidget {
  final Function() takePhoto;
  final Function() toggleVideoRecording;
  final CameraController? cameraController;
  final bool? isRecording;
  const CameraViewScreen(
      {super.key,
      required this.cameraController,
      required this.takePhoto,
      required this.toggleVideoRecording,
      this.isRecording});

  @override
  State<CameraViewScreen> createState() => _CameraViewScreenState();
}

class _CameraViewScreenState extends State<CameraViewScreen> {
  bool _isRecording = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: FlutterCamera(
        color: Colors.amber,
      ),
    );
  }
}

class CameraControls extends StatefulWidget {
  CameraController? controller;

  CameraControls({@required this.controller});

  @override
  _CameraControlsState createState() => _CameraControlsState();
}

class _CameraControlsState extends State<CameraControls> {
  bool isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.switch_camera),
              onPressed: () async {
                await widget.controller!.dispose();
                final cameras = await availableCameras();
                widget.controller = CameraController(
                  cameras[0],
                  ResolutionPreset.medium,
                );
                await widget.controller!.initialize();
                setState(() {});
              },
            ),
            SizedBox(width: 16.0),
            IconButton(
              icon: Icon(Icons.flash_on),
              onPressed: () {
                // Implement flash control logic
              },
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () async {
                try {
                  await widget.controller!.initialize();
                  final XFile file = await widget.controller!.takePicture();
                  // Handle the captured photo
                } catch (e) {}
              },
              child: Icon(Icons.camera),
            ),
            SizedBox(width: 20.0),
            FloatingActionButton(
              onPressed: () async {
                if (isRecording) {
                  await widget.controller!.stopVideoRecording();
                  // Handle the captured video
                } else {
                  await widget.controller!.startVideoRecording();
                }
                setState(() {
                  isRecording = !isRecording;
                });
              },
              child: Icon(isRecording ? Icons.stop : Icons.videocam),
            ),
          ],
        ),
      ],
    );
  }
}
