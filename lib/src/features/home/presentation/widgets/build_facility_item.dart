import 'package:flutter/material.dart';
// import 'package:nsvilecity/src/features/home/presentation/views/sign_in_view.dart';

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
          if (name == 'Login') {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const LoginView()),
            // );
          }
        },
      ),
    );
  }
}
