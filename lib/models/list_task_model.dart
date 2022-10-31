import 'package:mobx_with_database/models/task_model.dart';

class ListTaskModel {
  late List<TaskModel> listTasks;
  ListTaskModel({
    required this.listTasks,
  });

  ListTaskModel.fromJson(Map<String, dynamic> json) {
    listTasks =
        List.from(json['listTasks']).map((e) => TaskModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['listTasks'] = listTasks.map((e) => e.toJson()).toList();
    return _data;
  }
}
