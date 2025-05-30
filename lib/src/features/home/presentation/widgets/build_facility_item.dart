import 'package:flutter/material.dart';
import 'package:nsvilecity/src/features/home/presentation/views/mosque_view.dart';
import 'package:nsvilecity/src/features/home/presentation/views/spbu_view.dart';

class BuildFacilityItem extends StatelessWidget {
  final IconData icon;
  final String name;
  const BuildFacilityItem({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(name),
        trailing: const Icon(Icons.directions),
        onTap: () {
          if (name == 'Masjid') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MosqueView()),
            );
          }
          if (name == 'SPBU') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SpbuView()),
            );
          }
          if (name == 'ATM') {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const AtmuView()),
            // );
          }
          if (name == 'Rumah Sakit') {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const RsView()),
            // );
          }
          if (name == 'Kantor Polisi') {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const PolisiView()),
            // );
          }
        },
      ),
    );
  }
}