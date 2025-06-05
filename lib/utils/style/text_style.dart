import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:remindery/core/static_constants/asset_constant.dart';
import 'package:remindery/utils/colors/hex_colors.dart';

class AppTextStyle {
  static TextStyle openSans16() {
    return GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: HexColor(appColor434345),
    );
  }

  static TextStyle poppins11() {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 11,
      color: HexColor(appColor808080),
    );
  }

  static TextStyle sourceSerif28() {
    return GoogleFonts.sourceSerif4(
      fontWeight: FontWeight.w800,
      fontSize: 28,
      color: HexColor(neutral50),
      decoration: TextDecoration.none,
    );
  }

  static TextStyle sathosiRegular11() {
    return TextStyle(
      fontFamily: AssetConstant.fontSatoshiRegular,
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  static TextStyle sathosiRegular12() {
    return TextStyle(
      fontFamily: AssetConstant.fontSatoshiRegular,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  static TextStyle sathosiRegular13() {
    return TextStyle(
      fontFamily: AssetConstant.fontSatoshiRegular,
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  static TextStyle sathosiRegular15() {
    return TextStyle(
      fontFamily: AssetConstant.fontSatoshiRegular,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  static TextStyle sathosiRegular16() {
    return TextStyle(
      fontFamily: AssetConstant.fontSatoshiRegular,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  static TextStyle sathosiRegular17() {
    return TextStyle(
      fontFamily: AssetConstant.fontSatoshiRegular,
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  static TextStyle sathosiRegular20() {
    return TextStyle(
      fontFamily: AssetConstant.fontSatoshiRegular,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  static TextStyle sathosiRegular22() {
    return TextStyle(
      fontFamily: AssetConstant.fontSatoshiRegular,
      fontSize: 22,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }


  static TextStyle sathosiRegular28() {
    return TextStyle(
      fontFamily: AssetConstant.fontSatoshiRegular,
      fontSize: 28,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  static TextStyle sathosiMedium17() {
    return TextStyle(
      fontFamily: AssetConstant.fontSatoshiMedium,
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  static TextStyle sathosiBold17() {
    return TextStyle(
      fontFamily: AssetConstant.fontSatoshiBold,
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }

  static TextStyle sathosiBold20() {
    return TextStyle(
      fontFamily: AssetConstant.fontSatoshiBold,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }

  static TextStyle sathosiBold28() {
    return TextStyle(
      fontFamily: AssetConstant.fontSatoshiBold,
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }
}
