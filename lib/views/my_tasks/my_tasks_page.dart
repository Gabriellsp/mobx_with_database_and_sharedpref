import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_with_database/models/task_model.dart';
import 'package:mobx_with_database/views/my_tasks/my_tasks_store.dart';
import 'package:mobx_with_database/views/my_tasks/widgets/task.dart';

class MyTasksPage extends StatefulWidget {
  const MyTasksPage({Key? key}) : super(key: key);

  @override
  State<MyTasksPage> createState() => _MyTasksPageState();
}

class _MyTasksPageState extends State<MyTasksPage> {
  var controller = MyTasksStore();
  final _textFieldController = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.loadTask();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Tasks'),
            actions: [
              Switch.adaptive(
                  value: controller.isSharedPref,
                  onChanged: (value) {
                    controller.setIsSharedPref(value);
                    controller.loadTask();
                  }),
            ],
            leading: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => controller.clearTasks(),
            ),
          ),
          body: controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    _textField,
                    const SizedBox(
                      height: 16,
                    ),
                    controller.tasks.isEmpty
                        ? const Center(
                            child: Text('Tasks Empty'),
                          )
                        : Expanded(
                            child: ListView.separated(
                              itemBuilder: (BuildContext context, int index) {
                                return Task(
                                    taskName: controller.tasks
                                        .elementAt(index)
                                        .taskName);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Divider(
                                    height: 24,
                                    thickness: 2,
                                    color: Colors.amberAccent),
                              ),
                              itemCount: controller.tasks.length,
                            ),
                          )
                  ],
                ),
        );
      },
    );
  }

  Widget get _textField => TextField(
        controller: _textFieldController,
        onChanged: _setShowAddButton,
        onEditingComplete: _saveTask,
        decoration: InputDecoration(
          hintText: 'Insert your task here ...',
          suffixIcon: controller.showAddButton == true
              ? IconButton(
                  onPressed: _saveTask,
                  icon: const Icon(Icons.send),
                )
              : null,
        ),
      );

  void _saveTask() {
    controller.saveTask(
        TaskModel(taskName: _textFieldController.text, isFinished: false));
    _textFieldController.clear();
  }

  void _setShowAddButton(String text) {
    text.isEmpty
        ? controller.setShowAddButon(false)
        : controller.setShowAddButon(true);
  }
}
