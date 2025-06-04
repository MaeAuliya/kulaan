import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class HospitalView extends StatefulWidget {
  const HospitalView({super.key});

  @override
  State<HospitalView> createState() => _HospitalViewState();
}

class _HospitalViewState extends State<HospitalView> {
  MapController? _mapController;
  LatLng? _currentPosition;
  List<Map<String, dynamic>> _hospitalList = [];

  final String mapboxAccessToken = 'pk.eyJ1IjoieW9raXNpdHVtb3JhbmciLCJhIjoiY20xMDlpdnlkMGR5NjJrc2c4dmxzb3c5MCJ9.0U2bCqI_zoIMg4YKtISrCw';

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCurrentLocation();
    });
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Layanan lokasi tidak aktif. Silakan aktifkan GPS.')),
        );
      }
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Izin lokasi ditolak')),
          );
        }
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Izin lokasi ditolak permanen. Buka pengaturan untuk mengizinkan.'),
          ),
        );
      }
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );
      if (mounted) {
        setState(() {
          _currentPosition = LatLng(position.latitude, position.longitude);
        });
        // _mapController?.move(_currentPosition!, 14.0);
        _fetchNearbyHospital(position.latitude, position.longitude);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error mendapatkan lokasi: $e')),
        );
      }
    }
  }

  Future<void> _fetchNearbyHospital(double latitude, double longitude) async {
    final String mapboxUrl =
        'https://api.mapbox.com/search/searchbox/v1/category/hospital?access_token=$mapboxAccessToken&language=en&limit=10&proximity=$longitude,$latitude';

    try {
      final response = await http.get(Uri.parse(mapboxUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> features = data['features'];

        setState(() {
          _hospitalList = features.map((e) {
            return {
              'name': e['properties']['name'] ?? 'Hospital Tanpa Nama',
              'latitude': e['geometry']['coordinates'][1] as double,
              'longitude': e['geometry']['coordinates'][0] as double,
            };
          }).toList();
        });
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Gagal mengambil data Hospital')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error mengambil data Hospital: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nearby Hospital',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _currentPosition!,
                initialZoom: 14.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token=$mapboxAccessToken',
                  additionalOptions: {
                    'accessToken': mapboxAccessToken,
                  },
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _currentPosition!,
                      child: const Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                    ..._hospitalList.map((hospital) {
                      return Marker(
                        point: LatLng(hospital['latitude'], hospital['longitude']),
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(hospital['name'])),
                            );
                          },
                          child: const Icon(
                            Icons.local_hospital,
                            color: Colors.blue,
                            size: 40,
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ],
            ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}