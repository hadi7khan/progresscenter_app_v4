import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class ProcessMention extends StatelessWidget {
  final String text;

  ProcessMention({required this.text});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: _buildTextSpan(),
    );
  }

  TextSpan _buildTextSpan() {
    RegExp regex = RegExp(r"@\[([^\]]+)\]\(user:(\d+)\)");

    List<TextSpan> textSpans = [];
    List<RegExpMatch> matches = regex.allMatches(text).toList();
    List<String> segments = text.split(regex);

    for (int i = 0; i < segments.length; i++) {
      textSpans.add(TextSpan(
        text: segments[i],
        style: TextStyle(
            color: Helper.textColor600,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400),
      ));

      if (i < matches.length) {
        RegExpMatch match = matches[i];
        RegExpMatch? userMatch =
            RegExp(r"\[([^\]]+)\]").firstMatch(match.group(0)!);
        RegExpMatch? idMatch = RegExp(r":(\d+)").firstMatch(match.group(0)!);

        String username = userMatch?.group(1) ?? '';
        String userId = idMatch?.group(1) ?? '';

        textSpans.add(
          TextSpan(
            text: '@$username',
            style: TextStyle(
                color: Helper.primary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('Tapped on mention: $userId');
              },
          ),
        );
      }
    }

    return TextSpan(children: textSpans);
  }
}