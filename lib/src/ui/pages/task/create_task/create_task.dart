import 'package:flutter/material.dart';
import 'package:organizer_app/src/ui/components/button_widget.dart';
import 'package:organizer_app/src/ui/components/text_input_widget.dart';
import 'package:organizer_app/src/ui/components/text_widget.dart';
import 'package:organizer_app/src/ui/global/index.dart';
import 'package:organizer_app/src/ui/pages/task/task_controller.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final TaskController taskController = TaskController();

  void nextPage() => Navigator.pushNamed(context, '/tasks');

  void closeModal() => Navigator.pop(context);

  void handleTask() async {
    final bool res = await taskController.createTask();
    showAlertDialog(res);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: TextWidget(
                      text: 'ADICIONAR NOVA\nTAREFA',
                      alignment: Alignment.center,
                      textAlign: TextAlign.center,
                      fontSize: GlobalStyles.getFontSize(context, 0.06),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    child: Column(
                      children: [
                        TextInputWidget(
                          hintText: 'SUA TAREFA',
                          height: 100,
                          maxLines: 255,
                          minLines: 1,
                          verticalPadding: 15,
                          controller: taskController.taskTextController,
                          margin: const EdgeInsets.only(top: 22, bottom: 15),
                        ),
                        TextInputWidget(
                          hintText: 'PRIORIDADE',
                          controller: taskController.priorityController,
                          margin: const EdgeInsets.only(bottom: 15),
                        ),
                        ButtonWidget(
                          text: 'ADICIONAR',
                          margin: const EdgeInsets.only(top: 15),
                          onClick: handleTask,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(bool value) {
    Widget okButton = ElevatedButton(
      child: const Text("Fechar"),
      onPressed: () {
        closeModal();
        if (value) nextPage();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(value ? 'Sucesso' : 'Erro'),
      content: Text(value ? "Tarefa criada com sucesso" : 'Ocorreu um erro'),
      actions: [okButton],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
