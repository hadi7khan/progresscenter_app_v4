import 'package:flutter/material.dart';

class InteractiveViewerOverlay extends StatefulWidget {
  final Widget child;
  final double? maxScale;

  const InteractiveViewerOverlay({
    Key? key,
    required this.child,
    this.maxScale,
  }) : super(key: key);

  @override
  _InteractiveViewerOverlayState createState() =>
      _InteractiveViewerOverlayState();
}

class _InteractiveViewerOverlayState extends State<InteractiveViewerOverlay>
    with SingleTickerProviderStateMixin {
  var viewerKey = GlobalKey();
  Rect? placeholder;
  OverlayEntry? entry;
  var controller = TransformationController();
  Matrix4Tween? snapTween;
  AnimationController? snap;

  @override
  void initState() {
    super.initState();
    snap = AnimationController(vsync: this);
    snap!.addListener(() {
      if (snapTween == null) return;
      controller.value = snapTween!.evaluate(snap!);
      if (snap!.isCompleted) {
        entry!.remove();
        entry = null;
        setState(() {
          placeholder = null;
        });
      }
    });
  }

  @override
  void dispose() {
    snap!.dispose();
    super.dispose();
  }

  Widget buildViewer(BuildContext context) {
    return InteractiveViewer(
        key: viewerKey,
        transformationController: controller,
        panEnabled: false,
        maxScale: 10,
        child: widget.child,
        onInteractionStart: (details) {
          if (placeholder != null) return;

          setState(() {
            var renderObject =
                viewerKey.currentContext!.findRenderObject() as RenderBox;
            placeholder = Rect.fromPoints(
              renderObject.localToGlobal(Offset.zero),
              renderObject
                  .localToGlobal(renderObject.size.bottomRight(Offset.zero)),
            );
          });

          entry = OverlayEntry(
            builder: (context) {
              return Positioned.fromRect(
                rect: placeholder!,
                child: buildViewer(context),
              );
            },
          );

          Overlay.of(context).insert(entry!);
        },
        onInteractionEnd: (details) {
          snapTween = Matrix4Tween(
            begin: controller.value,
            end: Matrix4.identity(),
          );
          snap!.value = 0;
          snap!.animateTo(
            1,
            duration: Duration(milliseconds: 250),
            curve: Curves.ease,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var viewer = placeholder != null
        ? SizedBox.fromSize(size: placeholder!.size)
        : buildViewer(context);

    return Container(
      child: viewer,
    );
  }
}