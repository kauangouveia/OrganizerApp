import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:organizer_app/src/models/task/task_model.dart';
import 'package:organizer_app/src/ui/components/text_widget.dart';
import 'package:organizer_app/src/ui/global/index.dart';
import 'package:organizer_app/src/ui/pages/task/task_controller.dart';
import 'package:organizer_app/src/ui/pages/task/tasks/components/circle_widget.dart';
import 'package:organizer_app/src/ui/pages/task/tasks/components/task_instruction.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final TaskController taskController = TaskController();

  @override
  void initState() {
    super.initState();
    handleTaskList();
  }

  void handleTaskList() async {
    await taskController.listTask();
    setState(() {});
  }

  void handleDeleteTask(int id) async {
    await taskController.deleteTask(id);
    handleTaskList();
  }

  void closeModal() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/create_task'),
        child: const Icon(
          Icons.add,
          color: GlobalColors.kBackgroundColor,
        ),
        backgroundColor: GlobalColors.kTextColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).padding.top + 10,
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                text: 'TAREFAS',
                alignment: Alignment.center,
                fontSize: GlobalStyles.getFontSize(context, 0.09),
              ),
              containerTaskInstructions(context),
              Observer(builder: (_) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: taskController.tasks!.length,
                  itemBuilder: ((context, index) {
                    final TaskModel item = taskController.tasks![index];
                    return expandableContainer(
                      id: item.id!,
                      handleEditTask: handleDeleteTask,
                      task: item.task!,
                      circleColor: item.priority == 'alta'
                          ? GlobalColors.kHightTaskColor
                          : item.priority == 'baixa'
                              ? GlobalColors.kLowTaskColor
                              : GlobalColors.kMediumTaskColor,
                    );
                  }),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget containerTaskInstructions(BuildContext context) {
    return Container(
      height: 35,
      width: MediaQuery.of(context).size.width * .75,
      margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: GlobalColors.kTaskCardColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          TaskInstruction(
            text: 'ALTA',
            circleColor: GlobalColors.kHightTaskColor,
          ),
          TaskInstruction(
            text: 'MÉDIA',
            circleColor: GlobalColors.kMediumTaskColor,
          ),
          TaskInstruction(
            text: 'BAIXA',
            circleColor: GlobalColors.kLowTaskColor,
          ),
        ],
      ),
    );
  }

  Widget expandableContainer({
    required String task,
    required Color circleColor,
    required int id,
    required Function handleEditTask,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Expandable(
        backgroundColor: GlobalColors.kTaskCardColor,
        firstChild: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleWidget(color: circleColor),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 260,
                height: 50,
                child: TextWidget(
                  text: task,
                  alignment: Alignment.center,
                  textColor: Colors.black,
                  fontSize: GlobalStyles.getFontSize(context, 0.035),
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
        secondChild: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextWidget(
                  text: task.length > 30 ? task : '',
                  alignment: Alignment.center,
                  textColor: Colors.black,
                  fontSize: GlobalStyles.getFontSize(context, 0.035),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    taskOptions('excluir', showAlertDialog, id),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget taskOptions(
    String text,
    Function onTap,
    int taskId,
  ) =>
      GestureDetector(
        onTap: () => onTap(taskId),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, top: 10),
          child: TextWidget(
            text: text,
            alignment: Alignment.center,
            textColor: Colors.black,
            fontSize: GlobalStyles.getFontSize(context, 0.038),
            decoration: TextDecoration.underline,
          ),
        ),
      );

  showAlertDialog(int taskId) {
    Widget confirmButton = ElevatedButton(
      child: const Text("Excluir"),
      onPressed: () {
        closeModal();
        handleDeleteTask(taskId);
      },
    );
    Widget cancelButton = ElevatedButton(
      child: const Text("Cancelar"),
      onPressed: () {
        closeModal();
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text('Excluir tarefa'),
      content: const Text("Deseja excluir essa tarefa?"),
      actions: [confirmButton, cancelButton],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
