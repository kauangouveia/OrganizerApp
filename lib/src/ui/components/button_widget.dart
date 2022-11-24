import 'package:flutter/material.dart';
import 'package:organizer_app/src/ui/global/index.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final EdgeInsets? margin;
  final Function()? onClick;

  const ButtonWidget({
    Key? key,
    required this.text,
    this.onClick,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 70,
        width: double.infinity,
        margin: margin ?? const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: GlobalColors.kTextColor,
            width: 1.7,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: GlobalStyles.getFontSize(context, 0.045),
            ),
          ),
        ),
      ),
    );
  }
}
