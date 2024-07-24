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
        appBar: AppBar(
          title: const Text('Tela inicial'),
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
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Observer(
            builder: (_) => ListView(
              children: [
                const Text(
                  'Tarefas?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                // Text(exerciseModel.howMake),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(color: Colors.black),
                ),
                const Text(
                  'Como estou me sentindo?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(taskStore.task.length, (index) {
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
                          print('Deletar ${task.id} - ${task.description}');
                        },
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ));
  }
}
