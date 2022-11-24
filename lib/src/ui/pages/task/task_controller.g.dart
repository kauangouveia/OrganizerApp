// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TaskController on _TaskControllerBase, Store {
  late final _$taskModelAtom =
      Atom(name: '_TaskControllerBase.taskModel', context: context);

  @override
  TaskModel? get taskModel {
    _$taskModelAtom.reportRead();
    return super.taskModel;
  }

  @override
  set taskModel(TaskModel? value) {
    _$taskModelAtom.reportWrite(value, super.taskModel, () {
      super.taskModel = value;
    });
  }

  late final _$createTaskAsyncAction =
      AsyncAction('_TaskControllerBase.createTask', context: context);

  @override
  Future<bool> createTask() {
    return _$createTaskAsyncAction.run(() => super.createTask());
  }

  late final _$_TaskControllerBaseActionController =
      ActionController(name: '_TaskControllerBase', context: context);

  @override
  TaskModel createTaskModel() {
    final _$actionInfo = _$_TaskControllerBaseActionController.startAction(
        name: '_TaskControllerBase.createTaskModel');
    try {
      return super.createTaskModel();
    } finally {
      _$_TaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
taskModel: ${taskModel}
    ''';
  }
}
