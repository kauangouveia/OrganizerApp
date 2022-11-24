import 'package:flutter/material.dart';
import 'package:organizer_app/src/ui/global/index.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? textColor;
  final AlignmentGeometry alignment;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final TextDecoration? decoration;
  final TextAlign? textAlign;


  const TextWidget({
    Key? key,
    required this.text,
    required this.alignment,
    this.fontSize,
    this.textColor,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.decoration, this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        overflow: overflow,
        maxLines: maxLines,
        softWrap: softWrap,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize ?? GlobalStyles.getFontSize(context, 0.04),
          color: textColor ?? GlobalColors.kTextColor,
          decoration: decoration,
        ),
      ),
    );
  }
}
