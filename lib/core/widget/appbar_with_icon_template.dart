import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:remindery/core/static_constants/asset_constant.dart';
import 'package:remindery/utils/colors/hex_colors.dart';

class AppBarWithIconTemplate extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool enableCenterTitle;
  final bool isBackButtonEnabled;
  final Widget? customBackButton;
  final List<Widget>? actionWidget;
  final Color? backgroundColor;

  const AppBarWithIconTemplate({
    super.key,
    required this.title,
    required this.enableCenterTitle,
    this.actionWidget,
    this.isBackButtonEnabled = true,
    this.customBackButton,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 88.0,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? HexColor(tertiary50),
      surfaceTintColor: Colors.transparent,
      titleSpacing: 0,
      centerTitle: enableCenterTitle,
      iconTheme: IconThemeData(color: HexColor(appColor2D2727)),
      elevation: 0,
      leading: isBackButtonEnabled
          ? (customBackButton ??
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  child: SvgPicture.asset(
                    AssetConstant.iconArrowLeft,
                  ),
                ),
              ))
          : null,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 16.0),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: AssetConstant.fontSatoshiRegular,
            fontSize: 20,
            fontWeight: FontWeight.w400
          ),
          textAlign: TextAlign.center,
        ),
      ),
      actions: actionWidget,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(88);
}
