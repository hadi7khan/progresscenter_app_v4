import 'package:flutter/material.dart';

class TeamsScreen extends StatefulWidget {
  final label;
  final detailsPath;
  const TeamsScreen({super.key, this.label, this.detailsPath});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text("Teams"),
      )),
    );
  }
}
