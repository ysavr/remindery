import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:remindery/core/static_constants/asset_constant.dart';
import 'package:remindery/core/widget/app_button_widget.dart';
import 'package:remindery/utils/colors/hex_colors.dart';

bottomSheetWidget(
  context, {
  required String tittle,
  required String header,
  required String body,
  required String buttonTittle,
  required bool buttonIsVisible,
  bool buttonCloseIsVisible = true,
  required String logo,
  required var onTapBack,
  required Function onClose,
  required var onSave,
  bool canPop = true,
}) {
  showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      enableDrag: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return PopScope(
          canPop: canPop,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              padding: const EdgeInsets.all(12),
              color: HexColor(bottomSheetColor).withOpacity(0.5),
              child: Wrap(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tittle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          fontFamily: AssetConstant.fontSatoshiRegular,
                        ),
                      ),
                      buttonCloseIsVisible
                          ? GestureDetector(
                              onTap: () => onClose(),
                              child: SvgPicture.asset(
                                  AssetConstant.iconCloseCircle),
                            )
                          : Container(),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: HexColor('283562'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: SvgPicture.asset(
                          logo,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Text(
                          header,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontFamily: AssetConstant.fontSatoshiBold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Text(
                          body,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: AssetConstant.fontSatoshiRegular,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                  buttonIsVisible
                      ? AppButtonWidget(
                          isLoading: false,
                          text: buttonTittle,
                          radius: 24,
                          onTap: () {
                            onSave();
                          },
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      });
}
