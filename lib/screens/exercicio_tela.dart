// import 'package:flutter/material.dart';
// import 'package:studies/_common/colors.dart';
// import 'package:studies/models/task_model.dart';
// import 'package:studies/models/feeling_model.dart';

// class ExercicioTela extends StatelessWidget {
//   ExercicioTela({super.key});

//   final ExerciseModel exerciseModel = ExerciseModel(
//       id: '001',
//       name: 'Remada Baixa Supinada',
//       training: 'Treino A',
//       howMake: 'Segura a barra e puxaa');

//   final List<FeelingModel> feelings = [
//     FeelingModel(id: '001', feeling: "Pouca ativação hoje", data: '2024-07-05'),
//     FeelingModel(id: '002', feeling: "To bem", data: '2024-07-10'),
//     FeelingModel(id: '003', feeling: "Deu ruim", data: '2024-07-15'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.blue,
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: MyColors.darkBlue,
//           elevation: 0,
//           toolbarHeight: 72,
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.vertical(bottom: Radius.circular(32))),
//           title: Column(children: [
//             Text(
//               exerciseModel.name,
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
//             ),
//             Text(
//               exerciseModel.training,
//               style: const TextStyle(fontSize: 15),
//             )
//           ]),
//         ),
//         floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               print('foi clicado!');
//             },
//             child: const Icon(Icons.add)),
//         body: Container(
//           margin: const EdgeInsets.all(8),
//           padding: const EdgeInsets.all(16.0),
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(16)),
//           child: ListView(
//             children: [
//               SizedBox(
//                 height: 250,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {},
//                       child: const Text('Enviar foto'),
//                     ),
//                     ElevatedButton(
//                         onPressed: () {}, child: const Text('Tirar foto'))
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               const Text(
//                 'Como fazer?',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Text(exerciseModel.howMake),
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Divider(color: Colors.black),
//               ),
//               const Text(
//                 'Como estou me sentindo?',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: List.generate(feelings.length, (index) {
//                   FeelingModel feeling = feelings[index];
//                   return ListTile(
//                     dense: true,
//                     contentPadding: EdgeInsets.zero,
//                     title: Text(feeling.feeling),
//                     subtitle: Text(feeling.data),
//                     leading: const Icon(Icons.double_arrow),
//                     trailing: IconButton(
//                       icon: const Icon(
//                         Icons.delete,
//                         color: Colors.red,
//                       ),
//                       onPressed: () {
//                         print('Deletar ${feeling.id} - ${feeling.feeling}');
//                       },
//                     ),
//                   );
//                 }),
//               )
//             ],
//           ),
//         ));
//   }
// }
