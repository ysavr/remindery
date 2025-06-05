import 'package:flutter/material.dart';

import 'package:remindery/utils/colors/hex_colors.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget? childWidget;
  const BackgroundWidget({super.key, this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            HexColor(backgroundColor1),
            HexColor(backgroundColor2),
            HexColor(backgroundColor3),
          ],
        ),
      ),
      child: childWidget,
    );
  }
}
