// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStore, Store {
  late final _$taskAtom = Atom(name: '_TaskStore.task', context: context);

  @override
  ObservableList<TaskModel> get task {
    _$taskAtom.reportRead();
    return super.task;
  }

  @override
  set task(ObservableList<TaskModel> value) {
    _$taskAtom.reportWrite(value, super.task, () {
      super.task = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_TaskStore.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$doneAtom = Atom(name: '_TaskStore.done', context: context);

  @override
  bool get done {
    _$doneAtom.reportRead();
    return super.done;
  }

  @override
  set done(bool value) {
    _$doneAtom.reportWrite(value, super.done, () {
      super.done = value;
    });
  }

  late final _$_TaskStoreActionController =
      ActionController(name: '_TaskStore', context: context);

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_TaskStoreActionController.startAction(
        name: '_TaskStore.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDone(bool value) {
    final _$actionInfo =
        _$_TaskStoreActionController.startAction(name: '_TaskStore.setDone');
    try {
      return super.setDone(value);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTask(TaskModel value) {
    final _$actionInfo =
        _$_TaskStoreActionController.startAction(name: '_TaskStore.addTask');
    try {
      return super.addTask(value);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTaskDone({required int index, required dynamic newDone}) {
    final _$actionInfo = _$_TaskStoreActionController.startAction(
        name: '_TaskStore.changeTaskDone');
    try {
      return super.changeTaskDone(index: index, newDone: newDone);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTask(TaskModel value) {
    final _$actionInfo =
        _$_TaskStoreActionController.startAction(name: '_TaskStore.deleteTask');
    try {
      return super.deleteTask(value);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
task: ${task},
description: ${description},
done: ${done}
    ''';
  }
}
