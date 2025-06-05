import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:remindery/core/static_constants/asset_constant.dart';
import 'package:remindery/utils/style/text_style.dart';

class BadgeWidget extends StatelessWidget {
  final String labelTittle;
  final Color labelColor;
  final Color textColor;
  final Function onClose;
  final FontWeight? fontWeight;

  const BadgeWidget({
    super.key,
    required this.labelTittle,
    required this.labelColor,
    required this.textColor,
    required this.onClose,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(26),
        ),
        color: labelColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            labelTittle,
            style: AppTextStyle.sathosiRegular13().copyWith(
                color: textColor, fontWeight: fontWeight ?? FontWeight.w400),
          ),
          const SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: () => onClose(),
            child: SvgPicture.asset(AssetConstant.iconCloseCircleUnfilled),
          )
        ],
      ),
    );
  }
}
