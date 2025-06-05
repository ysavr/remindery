import 'package:flutter/material.dart';

import 'package:remindery/utils/colors/hex_colors.dart';
import 'package:remindery/utils/style/text_style.dart';

class AppBorderButtonWidget extends StatelessWidget {
  final String text;
  final Function onTap;
  final double? width;
  final double? height;
  final bool isActive;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? horizontalPadding;
  final double radius;

  const AppBorderButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
    this.isActive = true,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.horizontalPadding,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isActive && !isLoading) onTap();
      },
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: borderColor != null ? borderColor! : HexColor('#0cb9d7'),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: AppTextStyle.openSans16().copyWith(
                  color: (isActive && !isLoading)
                      ? textColor ?? Colors.white
                      : HexColor("F7FAFD"),
                  fontWeight: FontWeight.w600,
                ),
              ),
              isLoading
                  ? const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
