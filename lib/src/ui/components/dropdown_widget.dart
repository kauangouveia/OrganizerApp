import 'package:flutter/material.dart';
import 'package:organizer_app/src/ui/global/index.dart';
import 'package:organizer_app/src/ui/pages/task/task_controller.dart';

class DropdownWidget extends StatefulWidget {
  final TaskController taskController;

  const DropdownWidget({Key? key, required this.taskController})
      : super(key: key);

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String dropDownValue = 'Alta';

  final List<String> dropDownsItems = [
    'Alta',
    'Média',
    'Baixa',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 75,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 13, 15, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: GlobalColors.kTextColor,
          width: 1.7,
        ),
      ),
      child: DropdownButtonFormField(
        hint: const Text(
          'PRIORIDADE',
          style: TextStyle(color: GlobalColors.kTextColor),
        ),
        items: dropDownsItems.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (value) {
         widget.taskController.priorityController.text =
              value.toString().toLowerCase().replaceAll('é', 'e');
        },
      ),
    );
  }
}
