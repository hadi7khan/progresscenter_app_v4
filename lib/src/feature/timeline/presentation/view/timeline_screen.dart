import 'package:flutter/material.dart';

class TimelineScreen extends StatefulWidget {
  final String label;
  final String detailsPath;
  const TimelineScreen({super.key, required this.label, required this.detailsPath});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}