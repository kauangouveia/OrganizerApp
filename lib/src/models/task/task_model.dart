class TaskModel {
  String? priority;
  String? task;

  TaskModel({this.priority, this.task});

  TaskModel.fromJson(Map<String, dynamic> json) {
    priority = json['priority'];
    task = json['task'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['priority'] = priority;
    data['task'] = task;
    return data;
  }
}