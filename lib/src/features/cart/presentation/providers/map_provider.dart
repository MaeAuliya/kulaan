import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;

import '../../domain/entities/core_seller.dart';

class MapProvider extends ChangeNotifier {
  void initMap() {
    _sellers = null;
    _currentSeller = null;
  }

  Position? _livePosition;

  Position? get livePosition => _livePosition;

  void initLivePosition(Position position) {
    _livePosition = position;
    notifyListeners();
  }

  List<CoreSeller>? _sellers;

  List<CoreSeller>? get sellers => _sellers;

  void initLocations(List<CoreSeller> locations) {
    _sellers = locations;
    notifyListeners();
  }

  mapbox.PointAnnotation? _selectedSeller;

  mapbox.PointAnnotation? get selectedSeller => _selectedSeller;

  void setNewSelectedMarker(mapbox.PointAnnotation newSeller) {
    _selectedSeller = newSeller;
    notifyListeners();
  }

  mapbox.ScreenCoordinate? _markerScreenPosition;

  mapbox.ScreenCoordinate? get markerScreenPosition => _markerScreenPosition;

  void setNewSellerScreenPosition(mapbox.ScreenCoordinate? newPosition) {
    _markerScreenPosition = newPosition;
    notifyListeners();
  }

  CoreSeller? _currentSeller;

  CoreSeller? get currentSeller => _currentSeller;

  void setEntityMarker(CoreSeller newSeller) {
    _currentSeller = newSeller;
    notifyListeners();
  }

  void resetMarker() {
    _currentSeller = null;
    notifyListeners();
  }

  Position? _currentPosition;

  Position? get currentPosition => _currentPosition;

  void initPosition(Position newPosition) {
    _currentPosition = newPosition;
    notifyListeners();
  }
}
