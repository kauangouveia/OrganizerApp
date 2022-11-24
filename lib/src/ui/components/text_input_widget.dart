import 'package:flutter/material.dart';

import '../global/index.dart';

class TextInputWidget extends StatelessWidget {
  final String hintText;
  final double? height;
  final EdgeInsets? margin;
  final int? maxLines;
  final int? minLines;
  final double? verticalPadding;
  final TextEditingController? controller;

  const TextInputWidget({
    Key? key,
    required this.hintText,
    this.height = 75,
    this.margin,
    this.maxLines,
    this.minLines,
    this.verticalPadding,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 15),
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 13, 15, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: GlobalColors.kTextColor,
          width: 1.7,
        ),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        minLines: minLines,
        style: TextStyle(
          fontSize: GlobalStyles.getFontSize(context, 0.043),
          height: 2.2,
        ),
        cursorColor: GlobalColors.kTextColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: GlobalColors.kTextColor,
            fontSize: GlobalStyles.getFontSize(context, 0.04),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? 0,
            horizontal: 8,
          ),
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }
}