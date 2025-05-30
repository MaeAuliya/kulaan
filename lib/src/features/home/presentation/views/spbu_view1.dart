// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:latlong2/latlong.dart';

// class SpbuView extends StatefulWidget {
//   const SpbuView({super.key});

//   @override
//   State<SpbuView> createState() => _SpbuViewState();
// }

// class _SpbuViewState extends State<SpbuView> {
//   MapController? _mapController;
//   LatLng? _currentPosition;
//   static const LatLng _initialPosition = LatLng(-6.2088, 106.8456);

//   @override
//   void initState() {
//     super.initState();
//     _mapController = MapController();
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return; 
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       return;
//     }

//     try {
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//       setState(() {
//         _currentPosition = LatLng(position.latitude, position.longitude);
//       });

//       _mapController?.move(_currentPosition!, 14.0);
//     } catch (e) {
//       print('Error getting location: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Nearby SPBU',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.blue,
//       ),
//       body: FlutterMap(
//         mapController: _mapController,
//         options: MapOptions(
//           initialCenter: _currentPosition ?? _initialPosition,
//           initialZoom: 14.0,
//         ),
//         children: [
//           TileLayer(
//             urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//             userAgentPackageName: 'com.example.app',
//           ),
//           if (_currentPosition != null)
//             MarkerLayer(
//               markers: [
//                 Marker(
//                   point: _currentPosition!,
//                   child: const Icon(
//                     Icons.location_pin,
//                     color: Colors.red,
//                     size: 40,
//                   ),
//                 ),
//               ],
//             ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _mapController?.dispose();
//     super.dispose();
//   }
// }