import 'package:mobx/mobx.dart';
import 'package:mobx_with_database/models/task_model.dart';
import 'package:mobx_with_database/views/my_tasks/my_tasks_repository.dart';
part 'my_tasks_store.g.dart';

class MyTasksStore = _MyTasksStoreBase with _$MyTasksStore;

abstract class _MyTasksStoreBase with Store {
  final _repository = MyTasksRepository();

  var tasks = ObservableList<TaskModel>();

  @observable
  bool isSharedPref = false;

  @observable
  bool showAddButton = false;

  @observable
  bool isLoading = false;

  @action
  void setShowAddButon(value) => showAddButton = value;

  @action
  void setIsLoading(value) => isLoading = value;

  @action
  void setIsSharedPref(value) => isSharedPref = value;

  @action
  Future<void> loadTask() async {
    tasks.clear();
    setIsLoading(true);
    var listLocalTasks = <TaskModel>[];
    if (isSharedPref) {
      listLocalTasks = await _repository.getTasksSharedPref();
    } else {
      listLocalTasks = await _repository.getTasksSQFlite();
    }
    tasks.addAll(listLocalTasks);
    setIsLoading(false);
  }

  @action
  Future<void> saveTask(TaskModel task) async {
    addTask(task);
    if (isSharedPref) {
      await _repository.saveTaskSharedPref(task);
    } else {
      await _repository.saveTaskSQFlite(task);
    }
  }

  @action
  Future<void> clearTasks() async {
    tasks.clear();
    if (isSharedPref) {
      await _repository.deleteTasksSharedPref();
    } else {
      await _repository.deleteTasksSQFlite();
    }
  }

  @action
  void addTask(TaskModel task) {
    tasks.add(task);
  }
}
