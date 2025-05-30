import 'package:flutter/material.dart';
import 'package:nsvilecity/src/features/home/presentation/bloc/home_state.dart';
import 'package:nsvilecity/src/features/home/presentation/widgets/build_facility_item.dart';

class HomeView extends StatelessWidget {
  final HomeState currentState;
  const HomeView({super.key, required this.currentState,});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fasilitas Terdekat Berdasarkan Lokasi Anda',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  BuildFacilityItem(name: 'Masjid',icon: Icons.mosque),
                  BuildFacilityItem(name: 'SPBU',icon: Icons.local_gas_station),
                  BuildFacilityItem(name: 'ATM',icon: Icons.atm),
                  BuildFacilityItem(name: 'Rumah Sakit',icon: Icons.local_hospital),
                  BuildFacilityItem(name: 'Kantor Polisi',icon: Icons.local_police),
                ],
              ),
            ),
          ],
        ),
      );
  }
}