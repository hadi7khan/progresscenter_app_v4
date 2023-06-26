import 'package:flutter/material.dart';

class ProjectsScreen extends StatefulWidget {
  final String label;
  final String detailsPath;
  const ProjectsScreen({super.key, required this.label, required this.detailsPath});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Center(child: Text("Projects"),)),);
  }
}