class TaskModel {
  String? priority;
  String? task;
  int? id;

  TaskModel({this.priority, this.task});

  TaskModel.fromJson(Map<String, dynamic> json) {
    priority = json['priority'];
    task = json['task'];
    id = json['id_task'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['priority'] = priority;
    data['task'] = task;
    return data;
  }
}