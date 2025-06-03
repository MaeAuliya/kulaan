// // mosque

// import 'package:flutter/material.dart';

// class MosqueView extends StatelessWidget {
//   const MosqueView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Nearby Mosques',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'List of Nearby Mosques',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             Expanded(
//               child: ListView(
//                 children: const [
//                   MosqueItem(name: 'Masjid Al-Hikmah', distance: '0.5 km'),
//                   MosqueItem(name: 'Masjid Nurul Iman', distance: '1.2 km'),
//                   MosqueItem(name: 'Masjid Jami', distance: '2.0 km'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MosqueItem extends StatelessWidget {
//   final String name;
//   final String distance;

//   const MosqueItem({super.key, required this.name, required this.distance});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       child: ListTile(
//         leading: const Icon(Icons.mosque, color: Colors.green),
//         title: Text(name),
//         subtitle: Text('Distance: $distance'),
//         trailing: const Icon(Icons.directions),
//         onTap: () {
//           // Add navigation to maps or further details here
//         },
//       ),
//     );
//   }
// }