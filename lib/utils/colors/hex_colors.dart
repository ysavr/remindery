import 'package:flutter/material.dart';

String neutral50 = '23272e';
String neutral100 = '353a45';
String neutral200 = '3c4350';
String neutral300 = '454e5f';
String neutral500 = '677489';
String neutral700 = 'B2BAC7';
String neutral950 = 'f6f7f9';

String primary50 = '0a2647';
String primary100 = '0F3C6B';
String primary200 = '0B4781';
String primary500 = '1486e3';
String primary600 = '3DA1F3';
String primary700 = '81c1f8';
String primary800 = 'BCDCFB';
String primary900 = 'E1EEFD';

String secondary500 = '0abbd5';

String tertiary50 = '32076e';
String tertiary100 = '5211a1';
String tertiary200 = '6412c5';
String tertiary300 = '7716eb';
String tertiary400 = '801fff';
String tertiary500 = '904dff';

String appColor399cfb = '399cfb';
String appColor00DE9C = '00DE9C';
String appColorDDDDDD = 'DDDDDD';
String appColor222222 = '222222';
String appColor2D2727 = '2D2727';
String appColor434345 = '434345';
String appColorBFBFBF = 'BFBFBF';
String appColorF4FFEF = 'F4FFEF';
String appColor808080 = '808080';
String appColor00606A = '00606A';
String appColor4CBE7F = '4CBE7F';
String appColor403D3D = '403D3D';
String appColorC5A1A1 = 'C5A1A1';
String appColorCD4D31 = 'CD4D31';
String appColorFFFAFA = 'FFFAFA';
String appColorF7FAFD = 'F7FAFD';
String appColor6C120A = '6C120A';
String appColor6F788B = '6F788B';
String appColor049CFB = '049CFB';
String appColorF6F7FB = 'F6F7FB';
String appColorFF0000 = 'FF0000';
String appColor0389dd = '0389dd';
String appColor111729 = '111729';
String appColor364153 = '364153';
String appColorA8B0B9 = 'A8B0B9';
String appColor677489 = '677489';
String appColor0C1116 = '0C1116';
String appColor717D8A = '717D8A';
String appColorEAECEE = 'EAECEE';
String appColorFBEAE8 = 'FBEAE8';
String appColorD3291D = 'D3291D';
String appColorE9F7F1 = 'E9F7F1';
String appColor25AB73 = '25AB73';
String appColor0384D5 = '0384D5';
String appColor037DC9 = '037DC9';
String appColorE6F5FF = 'E6F5FF';
String appColorEB5757 = 'EB5757';
String appColorEEEEEE = 'EEEEEE';
String appColorF9E78F = 'F9E78F';
String appColor9B9B9B = '9B9B9B';
String appColor2A2D2C = '2A2D2C';
String appColor000000 = '000000';
String appColore8e9f0 = 'e8e9f0';
String appColorE7F0FC = 'E7F0FC';
String appColor0C66E4 = '0C66E4';
String appColorE3E8EF = 'E3E8EF';
String appColorCDD5E0 = 'CDD5E0';
String appColorF8FAFC = 'F8FAFC';
String appColor0677c2 = '0677c2';
String appColor098be2 = '098be2';
String appColorFFF8E1 = 'FFF8E1';
String appColorE4B519 = 'E4B519';
String appColorE5FCF5 = 'E5FCF5';
String appColorF9FAFB = 'F9FAFB';
String appColor4A5567 = '4A5567';

String backgroundColor1 = '061C48';
String backgroundColor2 = '020F27';
String backgroundColor3 = '250631';

String bottomSheetColor = '293B7F';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}