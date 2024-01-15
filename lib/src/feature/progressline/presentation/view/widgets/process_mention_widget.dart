import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';

class ProcessMention extends ConsumerStatefulWidget {
  final String text;

  ProcessMention({required this.text});

  @override
  ConsumerState<ProcessMention> createState() => _ProcessMentionState();
}

class _ProcessMentionState extends BaseConsumerState<ProcessMention> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: _buildTextSpan(),
    );
  }

  TextSpan _buildTextSpan() {
    RegExp regex = RegExp(r"@\[([^\]]+)\]\(user:(\d+)\)");

    List<TextSpan> textSpans = [];
    List<RegExpMatch> matches = regex.allMatches(widget.text).toList();
    List<String> segments = widget.text.split(regex);

    for (int i = 0; i < segments.length; i++) {
      textSpans.add(TextSpan(
        text: segments[i],
        style: TextStyle(
            letterSpacing: -0.3,
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
                letterSpacing: -0.3,
                color: ref.watch(primaryColorProvider),
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
