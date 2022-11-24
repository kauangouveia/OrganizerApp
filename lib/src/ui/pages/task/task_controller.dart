import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:organizer_app/src/models/task/task_model.dart';
import 'package:organizer_app/src/repositories/index.dart';

part 'task_controller.g.dart';

class TaskController = _TaskControllerBase with _$TaskController;

abstract class _TaskControllerBase with Store {
  TaskRepository taskRepository = TaskRepository();

  TextEditingController taskTextController = TextEditingController();
  TextEditingController priorityController = TextEditingController();

  @observable
  TaskModel? taskModel;

  @observable
  List<TaskModel>? tasks = [];

  @action
  TaskModel createTaskModel() {
    taskModel = TaskModel(
      task: taskTextController.text,
      priority: priorityController.text,
    );

    return taskModel!;
  }

  @action
  Future<bool> createTask() async {
    createTaskModel();

    try {
      final bool res = await taskRepository.createTask(
        taskModel!,
      );

      return res;
    } catch (e) {
      return false;
    }
  }

  @action
  Future<List> listTask() async {
    tasks = [];
    try {
      final res = await taskRepository.listTasks();

      if(res.statusCode != 200) return [];

      for (final item in res.data['listTask']) {
        taskModel = TaskModel.fromJson(item);

        tasks = List.from(tasks!..add(taskModel!));

      }
      return tasks!;
    } catch (e) {
      return [];
    }
  }

  @action
  Future<bool> deleteTask(int id) async {
    try {
      final res = await taskRepository.deleteTask(id);

      return res;
    } catch (e) {
      return false;
    }
  }
}
