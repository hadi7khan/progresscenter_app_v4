import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarWidget extends StatefulWidget {
  final String dpUrl;
  final String name;
  final String backgroundColor;
  final double size;
  final double fontSize;
  const AvatarWidget(
      {super.key,
      required this.dpUrl,
      required this.name,
      required this.backgroundColor,
      required this.size,
      required this.fontSize});

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  _getColor(
    String color,
  ) {
    color = "0xFF" + color.replaceAll("#", "");
    return Color(int.parse(color));
  }

  _getNameInitials(String name) {
    var buffer = StringBuffer();
    var split = name.split(' ');
    for (var i = 0; i < 1; i++) {
      buffer.write(split[i][0]);
    }

    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: widget.size +
      //     borderWidth * 2, // Adjust the size to include the border
      // height: widget.size +
      //     borderWidth * 2, // Adjust the size to include the border
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white, // Set the color of the outer circle border
        border: Border.all(
          color: Colors.white, // Set the color of the outer circle border
          width: 2, // Set the width of the outer circle border
        ),
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(200.r),
        child: widget.dpUrl != ""
            ? Image.network(
                width: widget.size,
                height: widget.size,
                widget.dpUrl,
                gaplessPlayback: true,
                fit: BoxFit.fill,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(200.r),
                    child: Image.asset(
                        width: widget.size,
                        height: widget.size,
                        'assets/images/error_image.jpeg',
                        fit: BoxFit.fill),
                  );
                },
              )
            : Container(
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _getColor(widget.backgroundColor),
                ),
                child: Center(
                  child: Text(
                    _getNameInitials(widget.name),
                    style: TextStyle(
                        color: Colors.white, fontSize: widget.fontSize.sp),
                  ),
                )),
      ),
    );
  }
}
