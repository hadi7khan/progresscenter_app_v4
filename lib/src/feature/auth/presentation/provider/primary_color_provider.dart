import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final primaryColorProvider = StateProvider<Color>((ref) {
  // Initial color
  return Color.fromRGBO(0, 82, 204, 1);
});
