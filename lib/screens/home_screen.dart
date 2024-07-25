import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:studies/models/task_model.dart';
import 'package:studies/service/auth_service.dart';
import 'package:studies/stores/task_store.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskStore = TaskStore();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Fastask'),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: ListView(
            children: [
              const Text(
                'Tarefas?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Como estou me sentindo?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              Observer(
                  builder: (_) => TextButton(
                      onPressed: () {
                        print('on press aqui');
                        taskStore.addTask(TaskModel(
                            id: '123', description: 'tarefa', done: false));
                      },
                      child: const Text('Adicionar tarefa'))),
              Observer(
                  builder: (_) => TextButton(
                      onPressed: () {
                        print(taskStore.task.length);
                      },
                      child: Text('TEste'))),
              Observer(
                builder: (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(taskStore.task.length, (index) {
                    print('${index} indeeex');
                    TaskModel task = taskStore.task[index];

                    return ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(task.id),
                      subtitle: Text(task.description),
                      leading: const Icon(Icons.double_arrow),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          taskStore.addTask(TaskModel(
                              id: '123', description: 'tarefa', done: false));
                        },
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
