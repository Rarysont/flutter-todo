import 'package:mobx/mobx.dart';
import '../models/task_model.dart';
part 'task_store.g.dart';

class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  @observable
  ObservableList<TaskModel> task = ObservableList<TaskModel>();

  @observable
  String description = '';

  @observable
  bool done = false;

  @action
  void setDescription(String value) {
    description = value;
  }

  @action
  void setDone(bool value) {
    done = value;
  }

  @action
  void addTask(TaskModel value) {
    task.add(value);
  }

  @action
  void changeTaskDone({required int index, required newDone}) {
    task[index] = TaskModel(
      id: task[index].id,
      description: task[index].description,
      done: newDone,
    );
  }

  @action
  void deleteTask(TaskModel value) {
    task.remove(value);
  }
}
