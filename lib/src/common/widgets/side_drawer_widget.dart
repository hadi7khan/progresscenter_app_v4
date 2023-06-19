import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  final show;
  const SideDrawer({super.key, this.show});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            color: Colors.grey.withOpacity(0.1),
          )
        ],
      ),
    );
  }
}
