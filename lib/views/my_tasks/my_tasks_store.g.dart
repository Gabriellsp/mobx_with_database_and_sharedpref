// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_tasks_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyTasksStore on _MyTasksStoreBase, Store {
  late final _$isSharedPrefAtom =
      Atom(name: '_MyTasksStoreBase.isSharedPref', context: context);

  @override
  bool get isSharedPref {
    _$isSharedPrefAtom.reportRead();
    return super.isSharedPref;
  }

  @override
  set isSharedPref(bool value) {
    _$isSharedPrefAtom.reportWrite(value, super.isSharedPref, () {
      super.isSharedPref = value;
    });
  }

  late final _$showAddButtonAtom =
      Atom(name: '_MyTasksStoreBase.showAddButton', context: context);

  @override
  bool get showAddButton {
    _$showAddButtonAtom.reportRead();
    return super.showAddButton;
  }

  @override
  set showAddButton(bool value) {
    _$showAddButtonAtom.reportWrite(value, super.showAddButton, () {
      super.showAddButton = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_MyTasksStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$loadTaskAsyncAction =
      AsyncAction('_MyTasksStoreBase.loadTask', context: context);

  @override
  Future<void> loadTask() {
    return _$loadTaskAsyncAction.run(() => super.loadTask());
  }

  late final _$saveTaskAsyncAction =
      AsyncAction('_MyTasksStoreBase.saveTask', context: context);

  @override
  Future<void> saveTask(TaskModel task) {
    return _$saveTaskAsyncAction.run(() => super.saveTask(task));
  }

  late final _$clearTasksAsyncAction =
      AsyncAction('_MyTasksStoreBase.clearTasks', context: context);

  @override
  Future<void> clearTasks() {
    return _$clearTasksAsyncAction.run(() => super.clearTasks());
  }

  late final _$_MyTasksStoreBaseActionController =
      ActionController(name: '_MyTasksStoreBase', context: context);

  @override
  void setShowAddButon(dynamic value) {
    final _$actionInfo = _$_MyTasksStoreBaseActionController.startAction(
        name: '_MyTasksStoreBase.setShowAddButon');
    try {
      return super.setShowAddButon(value);
    } finally {
      _$_MyTasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(dynamic value) {
    final _$actionInfo = _$_MyTasksStoreBaseActionController.startAction(
        name: '_MyTasksStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_MyTasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsSharedPref(dynamic value) {
    final _$actionInfo = _$_MyTasksStoreBaseActionController.startAction(
        name: '_MyTasksStoreBase.setIsSharedPref');
    try {
      return super.setIsSharedPref(value);
    } finally {
      _$_MyTasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTask(TaskModel task) {
    final _$actionInfo = _$_MyTasksStoreBaseActionController.startAction(
        name: '_MyTasksStoreBase.addTask');
    try {
      return super.addTask(task);
    } finally {
      _$_MyTasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSharedPref: ${isSharedPref},
showAddButton: ${showAddButton},
isLoading: ${isLoading}
    ''';
  }
}
