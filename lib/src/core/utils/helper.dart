import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class Helper {
  static Color primary = const Color.fromRGBO(0, 82, 204, 1);
  static Color secondary = const Color.fromRGBO(1, 1, 1, 1);
  static Color blendmode = const Color.fromRGBO(71, 71, 71, 1);
  static Color neutral500 = const Color.fromRGBO(73, 73, 73, 1);
  static Color textColor900 = const Color(0xFF101828);
  static Color textColor800 = const Color.fromRGBO(29, 41, 57, 1);
  static Color textColor700 = const Color.fromRGBO(52, 64, 84, 1);
  static Color textColor600 = const Color.fromRGBO(71, 84, 103, 1);
  static Color textColor500 = const Color.fromRGBO(102, 112, 133, 1);
  static Color textColor400 = const Color.fromRGBO(152, 162, 179, 1);
  static Color textColor300 = const Color.fromRGBO(208, 213, 221, 1);
  static Color color128 = const Color.fromRGBO(128, 128, 128, 1);
  static Color headerBackground = const Color.fromRGBO(248, 249, 251, 1);
  static Color widgetBackground = const Color.fromRGBO(246, 246, 246, 1);
  static Color screenBackground = const Color.fromRGBO(247, 247, 247, 1);
  static Color baseBlack = const Color.fromRGBO(0, 0, 0, 1);
  static Color iconColor = const Color.fromRGBO(75, 87, 104, 1);
  static const successColor = Color.fromARGB(255, 20, 160, 25);
  static const successColor300 = Color.fromRGBO(108, 233, 166, 1);
  static const switchActiveColor = Color.fromRGBO(52, 199, 89, 1);
  static const errorColor = Color.fromRGBO(240, 68, 56, 1);
  static const blueDark = Color.fromRGBO(41, 112, 255, 1);
  static const tabBarBackground = Color.fromRGBO(231, 231, 232, 1);
  static const svgBackground = Color.fromRGBO(242, 244, 247, 1);
  static const fillsBackground = Color.fromRGBO(118, 118, 128, 0.12);
  static const bottomIconBack = Color.fromRGBO(235, 243, 255, 1);
  static const cardBackground = Color.fromRGBO(246, 246, 246, 1);

  static getMediaType(String filename) {
    var contentType;
    if (filename.endsWith('.jpg') || filename.endsWith('.jpeg')) {
      contentType = MediaType('image', 'jpeg');
    } else if (filename.endsWith('.png')) {
      contentType = MediaType('image', 'png');
    } else if (filename.endsWith('.gif')) {
      contentType = MediaType('image', 'gif');
    } else if (filename.endsWith('.pdf')) {
      contentType = MediaType('application', 'pdf');
    } else if (filename.endsWith('.mp4')) {
      contentType = MediaType('video', 'mp4');
    }
    return contentType;
  }
}
