import 'package:flutter/material.dart';

class DocsScreen extends StatefulWidget {
  final label;
  final detailsPath;
  const DocsScreen({super.key, this.label, this.detailsPath});

  @override
  State<DocsScreen> createState() => _DocsScreenState();
}

class _DocsScreenState extends State<DocsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text("Docs"),
      )),
    );
  }
}
