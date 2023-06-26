import 'package:flutter/material.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final String label;
  const ProjectDetailsScreen({
    super.key,
    required this.label,
  });

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
