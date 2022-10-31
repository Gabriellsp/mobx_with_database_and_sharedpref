import 'dart:convert';

class TaskModel {
  late int? id;
  late String? taskName;
  late bool? isFinished;

  TaskModel({
    this.id,
    required this.taskName,
    required this.isFinished,
  });
  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskName = json['taskName'];
    isFinished = json['isFinished'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['taskName'] = taskName;
    _data['isFinished'] = isFinished;
    return _data;
  }

  Map<String, dynamic> toMap() {
    return {
      'taskName': taskName,
      'isFinished': isFinished! ? 1 : 0,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      taskName: map['taskName'],
      isFinished: map['isFinished'] == 1 ? true : false,
    );
  }
}
