import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:remindery/core/static_constants/asset_constant.dart';
import 'package:remindery/utils/colors/hex_colors.dart';
import 'package:remindery/utils/style/text_style.dart';

class AppPasswordField extends StatefulWidget {
  final String hintText;
  final TextAlign textAlign;
  final bool alwaysObscure;
  final TextEditingController controller;
  final TextStyle? textStyle;
  final Function(String)? onChange;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final bool isError;
  final String? errorMessage;
  final FocusNode? focusNode;
  final double height;
  final Color? hintColor;
  final Color? backgroundColor;
  final Color? borderColor;

  const AppPasswordField({
    super.key,
    required this.hintText,
    required this.controller,
    this.textAlign = TextAlign.start,
    this.alwaysObscure = false,
    this.textStyle,
    this.onChange,
    this.textInputType = TextInputType.text,
    this.inputFormatter,
    this.isError = false,
    this.focusNode,
    this.errorMessage = "",
    this.height = 46,
    this.backgroundColor,
    this.borderColor,
    this.hintColor,
  });

  @override
  AppPasswordFieldState createState() => AppPasswordFieldState();
}

class AppPasswordFieldState extends State<AppPasswordField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? HexColor(appColorFFFAFA),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.errorMessage != null
                  ? HexColor(appColorFF0000)
                  : (widget.borderColor ?? Colors.transparent),
            ),
          ),
          child: Row(
            children: [
              Flexible(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: TextFormField(
                    focusNode: widget.focusNode,
                    keyboardType: widget.textInputType,
                    onChanged: widget.onChange,
                    textAlign: widget.textAlign,
                    controller: widget.controller,
                    obscureText: isObscure,
                    style: AppTextStyle.sathosiRegular17().copyWith(color: Colors.white),
                    inputFormatters: widget.inputFormatter,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      hintStyle: AppTextStyle.sathosiRegular17().copyWith(
                        color: widget.hintColor ??
                            HexColor(appColor434345).withValues(alpha: 0.45),
                      ),
                    ),
                  ),
                ),
              ),
              widget.alwaysObscure
                  ? Container()
                  : Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        child: isObscure
                            ? SvgPicture.asset(AssetConstant.iconEyeSlash)
                            : SvgPicture.asset(AssetConstant.iconEye),
                      ),
                    ),
              const SizedBox(
                width: 6,
              ),
            ],
          ),
        ),
        widget.errorMessage != null
            ? Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  widget.errorMessage!,
                  style: AppTextStyle.poppins11()
                      .copyWith(color: HexColor(appColorCD4D31)),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
