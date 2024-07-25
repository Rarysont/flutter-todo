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
  void changeTaskDone({required int index, required bool newDone}) {
    final taskItem = task[index];

    task[index] = TaskModel(
      id: taskItem.id,
      description: taskItem.description,
      done: newDone,
    );
  }

  @action
  void deleteTask(TaskModel value) {
    task.remove(value);
  }

  @computed
  List<TaskModel> get pendingTasks => task.where((t) => !t.done).toList();

  @computed
  List<TaskModel> get completedTasks => task.where((t) => t.done).toList();
}
