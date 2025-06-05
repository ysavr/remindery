import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:remindery/core/static_constants/asset_constant.dart';
import 'package:remindery/utils/colors/hex_colors.dart';

class DropdownWithSearchTemplate extends StatelessWidget {
  final String type;
  final String hint;
  final List<String> list;
  final dynamic value;
  final Function valueModel;
  final TextEditingController textEditingController;
  final bool readOnly;

  const DropdownWithSearchTemplate(
      {super.key,
      required this.type,
      required this.hint,
      required this.list,
      required this.value,
      required this.valueModel,
      required this.textEditingController,
      required this.readOnly});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 46.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: readOnly ? HexColor(appColorEAECEE) : Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<dynamic>(
                  isExpanded: true,
                  hint: Text(
                    hint,
                    style: TextStyle(
                        color: HexColor(appColorA8B0B9),
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0),
                  ),
                  items: list
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyle(
                                  color: HexColor(appColor111729),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0),
                            ),
                          ))
                      .toList(),
                  value: value,
                  onChanged: readOnly
                      ? null
                      : (value) {
                          valueModel(type, value);
                        },
                  dropdownStyleData: DropdownStyleData(
                      elevation: 1,
                      isOverButton: true,
                      maxHeight: 400.0,
                      padding: EdgeInsets.zero,
                      decoration: const BoxDecoration(color: Colors.white),
                      scrollPadding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width),
                  menuItemStyleData: const MenuItemStyleData(
                      height: 40.0,
                      padding: EdgeInsets.only(left: 8.0, right: 8.0)),
                  // iconStyleData: IconStyleData(iconSize: 0.0),
                  dropdownSearchData: DropdownSearchData(
                    searchController: textEditingController,
                    searchInnerWidgetHeight: 50,
                    searchInnerWidget: Container(
                      height: 56.0,
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        bottom: 0.0,
                        right: 8.0,
                        left: 8.0,
                      ),
                      child: TextFormField(
                        expands: false,
                        maxLines: null,
                        style: TextStyle(
                            color: HexColor(appColor111729),
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0),
                        controller: textEditingController,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8,
                          ),
                          hintText: 'Search status...',
                          hintStyle: TextStyle(
                              color: HexColor(appColorA8B0B9),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: HexColor(appColor049CFB), width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: HexColor(appColor049CFB), width: 1.0),
                          ),
                        ),
                      ),
                    ),
                    searchMatchFn: (item, searchValue) {
                      return item.value.name
                          .toString()
                          .toLowerCase()
                          .contains(searchValue.toLowerCase());
                    },
                  ),
                  iconStyleData: readOnly
                      ? const IconStyleData(iconSize: 0.0)
                      : IconStyleData(
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 1.0),
                            child: SvgPicture.asset(
                              AssetConstant.iconArrowDown,
                              width: 20.0,
                              height: 20.0,
                              colorFilter: ColorFilter.mode(
                                  HexColor(appColor111729), BlendMode.srcIn),
                            ),
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.yellow,
                          iconDisabledColor: Colors.grey,
                        ),
                  onMenuStateChange: (isOpen) {
                    if (!isOpen) {
                      textEditingController.clear();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
