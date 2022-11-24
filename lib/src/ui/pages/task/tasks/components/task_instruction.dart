import 'package:flutter/material.dart';
import 'package:organizer_app/src/ui/components/text_widget.dart';
import 'package:organizer_app/src/ui/global/index.dart';
import 'package:organizer_app/src/ui/pages/task/tasks/components/circle_widget.dart';

class TaskInstruction extends StatelessWidget {
  final String text;
  final Color circleColor;

  const TaskInstruction({
    Key? key,
    required this.text,
    required this.circleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleWidget(color: circleColor),
        const SizedBox(width: 6),
        TextWidget(
          text: text,
          alignment: Alignment.center,
          fontSize: GlobalStyles.getFontSize(context, 0.035),
          textColor: Colors.black,
        ),
      ],
    );
  }
}
