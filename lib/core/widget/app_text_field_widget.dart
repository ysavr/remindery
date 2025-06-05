import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:remindery/utils/colors/hex_colors.dart';
import 'package:remindery/utils/style/text_style.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool enableInstantDelete;
  final TextInputType textInputType;
  final Widget? leading;
  final Function(String query) onChange;
  final Function(String query) onFieldSubmitted;
  final Function onTap;
  final Function onTapOutside;
  final bool? enabled;
  final Color? borderColor;
  final FocusNode? focusNode;
  final Widget? actionWidget;
  final Color? hintColor;
  final bool? autoFocus;
  final int maxLine;
  final int minLine;
  final String? errorMessage;
  final double? height;
  final Color? backgroundColor;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatter;

  const AppTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onChange,
    required this.onFieldSubmitted,
    required this.onTap,
    required this.onTapOutside,
    this.enableInstantDelete = false,
    this.maxLine = 1,
    this.minLine = 1,
    this.textInputType = TextInputType.text,
    this.leading,
    this.enabled,
    this.borderColor,
    this.actionWidget,
    this.hintColor,
    this.autoFocus,
    this.focusNode,
    this.errorMessage,
    this.inputFormatter,
    this.height = 46,
    this.readOnly = false,
    this.backgroundColor,
  });

  @override
  AppTextFieldState createState() => AppTextFieldState();
}

class AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.height,
          constraints: widget.height == null
              ? null
              : BoxConstraints(minHeight: 0, maxHeight: widget.height!),
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.errorMessage != null
                  ? HexColor(appColorFF0000)
                  : (widget.borderColor ?? Colors.transparent),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 17,
              right: 10,
            ),
            child: Row(
              children: [
                widget.leading ?? Container(),
                Flexible(
                  flex: 10,
                  child: TextFormField(
                    readOnly: widget.readOnly,
                    focusNode: widget.focusNode,
                    maxLines: widget.maxLine,
                    minLines: widget.minLine,
                    enabled: widget.enabled,
                    autofocus: widget.autoFocus ?? false,
                    onChanged: (string) {
                      widget.onChange(string);
                      setState(() {});
                    },
                    onTap: widget.onTap(),
                    onTapOutside: widget.onTapOutside(),
                    onFieldSubmitted: (query) {
                      widget.onFieldSubmitted(query);
                      setState(() {});
                    },
                    keyboardType: widget.textInputType,
                    inputFormatters: widget.inputFormatter,
                    style: AppTextStyle.sathosiRegular17().copyWith(color: Colors.black),
                    controller: widget.controller,
                    cursorColor: Colors.black,
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
                widget.actionWidget != null
                    ? Flexible(
                        flex: 1,
                        child: Center(child: widget.actionWidget!),
                      )
                    : Container(),
                (widget.enableInstantDelete &&
                        widget.controller.text.isNotEmpty)
                    ? Flexible(
                        flex: 1,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              widget.controller.clear();
                              widget.onChange("");
                              setState(() {});
                            },
                            child: const Icon(Icons.close),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
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
