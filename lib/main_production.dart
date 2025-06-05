import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/env/env.dart';
import 'core/flavor/flavour_config.dart';
import 'main.dart';
import 'utils/colors/hex_colors.dart';

Future<void> main() async {
  Env.loadEnvironment(Flavor.production);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: HexColor(backgroundColor1),
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  FlavorConfig(
    flavor: Flavor.production,
    values: FlavorValues(
      baseUrl: Env.baseUrl,
    ),
  );

  runZonedGuarded(() {
    mainApp();
  }, (error, stackTrace) {});
}
