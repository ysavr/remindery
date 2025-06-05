import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:remindery/utils/colors/hex_colors.dart';

appTopBarSuccess(BuildContext context,
    {required String message, int durationSecond = 2}) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    icon: SvgPicture.asset(
      "assets/svg/icon_success.svg",
      width: 20,
      height: 20,
    ),
    duration: Duration(seconds: durationSecond),
    message: message,
    backgroundColor: HexColor("#00BE98"),
  ).show(context);
}

appTopBarError(BuildContext context,
    {required String message, int durationSecond = 2}) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    icon: SvgPicture.asset(
      "assets/svg/icon_error.svg",
      width: 20,
      height: 20,
    ),
    duration: Duration(seconds: durationSecond),
    message: message.isNotEmpty ? message : "Terjadi Kesalahan!",
    backgroundColor: HexColor("#D0213F"),
  ).show(context);
}
