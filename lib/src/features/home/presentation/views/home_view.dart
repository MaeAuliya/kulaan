import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nsvilecity/src/features/home/presentation/bloc/home_state.dart';
import 'package:nsvilecity/src/features/home/presentation/widgets/build_facility_item.dart';

import '../../../../core/extensions/context_extension.dart';

class HomeView extends StatelessWidget {
  final HomeState currentState;
  const HomeView({
    super.key,
    required this.currentState,
  });

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.themeProvider;
    final isDarkMode = themeNotifier.isDarkMode;

    return WillPopScope(
      onWillPop: () async {
        bool shouldPop = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Konfirmasi'),
            content: const Text('Apakah Anda yakin ingin keluar?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Tidak'),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: const Text('Ya'),
              ),
            ],
          ),
        );

        return shouldPop;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('KULAAN'),
          actions: [
            Switch(
              value: isDarkMode,
              onChanged: (value) {
                themeNotifier.toggleTheme();
              },
              activeColor: Colors.deepPurple,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey[400],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Fasilitas Terdekat Berdasarkan Lokasi Anda',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    const BuildFacilityItem(name: 'Login', icon: Icons.login),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
