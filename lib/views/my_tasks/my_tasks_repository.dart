import 'dart:convert';

import 'package:mobx_with_database/database/db.dart';
import 'package:mobx_with_database/database/shared_pref.dart';
import 'package:mobx_with_database/models/list_task_model.dart';
import 'package:mobx_with_database/models/task_model.dart';

class MyTasksRepository {
  Future<void> saveTaskSharedPref(TaskModel task) async {
    final _database = await SharedPref.instance.database;
    var oldListTasks = await getTasksSharedPref();
    oldListTasks.add(task);
    var newListTask =
        jsonEncode(ListTaskModel(listTasks: oldListTasks).toJson());
    _database.setString('listTasks', newListTask);
  }

  Future<List<TaskModel>> getTasksSharedPref() async {
    final _database = await SharedPref.instance.database;
    var tasks = _database.getString('listTasks');
    if (tasks == null) return <TaskModel>[];
    var x = jsonDecode(tasks);
    return ListTaskModel.fromJson(x).listTasks;
  }

  Future<void> deleteTasksSharedPref() async {
    final _database = await SharedPref.instance.database;
    var newListTask = jsonEncode(ListTaskModel(listTasks: <TaskModel>[]));
    _database.setString('listTasks', newListTask);
  }

  Future<void> saveTaskSQFlite(TaskModel task) async {
    final _database = await Db.internal().database;
    _database.insert('myTasks', task.toMap());
  }

  Future<List<TaskModel>> getTasksSQFlite() async {
    final _database = await Db.instance.database;
    var tasks = <TaskModel>[];
    await _database.query('myTasks').then((value) {
      tasks = value.map((e) => TaskModel.fromMap(e)).toList();
    });
    return tasks;
  }

  Future<void> deleteTasksSQFlite() async {
    final _database = await Db.instance.database;
    await _database.delete('myTasks');
  }
}
