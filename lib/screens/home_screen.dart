import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:studies/_common/snackbar.dart';
import 'package:studies/components/decoration_input.dart';
import 'package:studies/models/task_model.dart';
import 'package:studies/service/auth_service.dart';
import 'package:studies/stores/task_store.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskStore = TaskStore();
    final Uuid uuid = Uuid();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.add_task,
            ),
            SizedBox(width: 10),
            Text('Tarefas')
          ],
        ),
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Deslogar'),
              leading: const Icon(Icons.logout),
              onTap: () {
                AuthService().logout();
              },
            )
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: ListView(
          children: [
            Observer(
              builder: (_) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: taskStore.setDescription,
                  decoration: getDecorationInput(
                      label: 'Adicionar tarefa',
                      icon: Icons.add_circle,
                      onPressIcon: () {
                        String randomUuid = uuid.v4();
                        taskStore.addTask(TaskModel(
                            id: randomUuid,
                            description: taskStore.description,
                            done: false));
                        showSnackBar(
                            context: context,
                            text: 'Tarefa criada com sucesso',
                            isError: false);
                      }),
                  validator: (String? value) {
                    if (value == null) {
                      return "A tarefa não de";
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              color: Colors.grey,
              height: 8,
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Tarefas a fazer',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
            Observer(
              builder: (_) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(taskStore.pendingTasks.length, (index) {
                  TaskModel task = taskStore.task[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        dense: true,
                        title: Text(task.description),
                        leading: IconButton(
                          icon: Icon(task.done
                              ? Icons.check_circle_outline
                              : Icons.circle_outlined),
                          color: task.done ? Colors.green : Colors.grey,
                          onPressed: () {
                            taskStore.changeTaskDone(
                                index: index, newDone: !task.done);
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            taskStore.deleteTask(task);
                            showSnackBar(
                                context: context,
                                text: 'Tarefa deletada com sucesso!',
                                isError: false);
                          },
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Tarefas concluidas',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
            Observer(
              builder: (_) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    List.generate(taskStore.completedTasks.length, (index) {
                  TaskModel task = taskStore.task[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        dense: true,
                        title: Text(task.description),
                        leading: IconButton(
                          icon: Icon(task.done
                              ? Icons.check_circle_outline
                              : Icons.circle_outlined),
                          color: task.done ? Colors.green : Colors.grey,
                          onPressed: () {
                            taskStore.changeTaskDone(
                                index: index, newDone: !task.done);
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            taskStore.deleteTask(task);
                          },
                        ),
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
