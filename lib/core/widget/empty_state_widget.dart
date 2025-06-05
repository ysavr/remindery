import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:remindery/core/widget/app_button_widget.dart';
import 'package:remindery/utils/colors/hex_colors.dart';
import 'package:remindery/utils/style/text_style.dart';

class EmptyStateWidget extends StatelessWidget {
  final String tittle;
  final String subTittle;
  final String icon;
  final String buttonTittle;
  final bool buttonIsVisible;
  final Function onPress;

  const EmptyStateWidget({
    super.key,
    required this.tittle,
    required this.subTittle,
    required this.icon,
    required this.buttonTittle,
    required this.buttonIsVisible,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          SvgPicture.asset(
            icon,
            height: 100,
            width: 100,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              tittle,
              style: AppTextStyle.sathosiRegular17()
                  .copyWith(color: HexColor(neutral950)),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              subTittle,
              style: AppTextStyle.sathosiRegular12().copyWith(
                color: HexColor(neutral700),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          buttonIsVisible
              ? AppButtonWidget(
                  isLoading: false,
                  text: buttonTittle,
                  radius: 24,
                  onTap: () => onPress(),
                )
              : Container(),
        ],
      ),
    );
  }
}
