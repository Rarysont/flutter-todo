import 'package:flutter/material.dart';
import 'package:studies/service/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
