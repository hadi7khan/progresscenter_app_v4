import 'package:flutter/material.dart';

class CameraDetailsSreen extends StatefulWidget {
  final String projectId;
  final String projectName;
  const CameraDetailsSreen({super.key, required this.projectId, required this.projectName});

  @override
  State<CameraDetailsSreen> createState() => _CameraDetailsSreenState();
}

class _CameraDetailsSreenState extends State<CameraDetailsSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Column(children: [
      //     // Text("Timelapse Camera", style: R,)
      //   ]),
      // ),
      body: SafeArea(child: Column()),
    );
  }
}