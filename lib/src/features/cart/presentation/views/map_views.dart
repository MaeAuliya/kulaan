import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/shared/views/loading_view.dart';
import '../../domain/entities/core_seller.dart';
import '../bloc/cart_bloc.dart';
import '../providers/map_provider.dart';

class MapViews extends StatefulWidget {
  const MapViews({
    super.key,
    required this.currentState,
  });

  final CartState currentState;

  @override
  State<MapViews> createState() => _MapViewsState();
}

class _MapViewsState extends State<MapViews> with WidgetsBindingObserver {
  MapboxMap? _mapboxMap;
  PointAnnotationManager? _pointAnnotationManager;

  CircleAnnotationManager? _circleAnnotationManager;
  CircleAnnotation? _circleAnnotation;

  final Map<String, CoreSeller> _markerMapping = {};

  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _mapboxMap = null;
    _searchController.dispose();
    WidgetsBinding.instance.addObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    // Handling when App turn to Resume Lifecycle
    if (state == AppLifecycleState.resumed && _mapboxMap != null) {
      await _mapboxMap?.triggerRepaint();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MapProvider>(
      builder: (_, provider, __) {
        if (provider.sellers == null) {
          return const LoadingView(
            isTransparent: false,
          );
        } else {
          double currentLat = provider.currentPosition!.latitude;
          double currentLong = provider.currentPosition!.longitude;
          return Container(
            color: Colours.white,
            child: Stack(
              children: [
                MapWidget(
                  onScrollListener: (eventData) async {
                    if (provider.currentSeller != null) {
                      provider.resetMarker();
                    }
                  },
                  cameraOptions: CameraOptions(
                    center:
                        Point(coordinates: Position(currentLong, currentLat)),
                    zoom: 15,
                  ),
                  styleUri: MapboxStyles.MAPBOX_STREETS,
                  onMapCreated: (mapboxMap) async {
                    // Initialize mapBox
                    _mapboxMap = mapboxMap;

                    // Initialize Current Location Circle
                    _circleAnnotationManager = await mapboxMap.annotations
                        .createCircleAnnotationManager();

                    _circleAnnotation = await _circleAnnotationManager
                        ?.create(CircleAnnotationOptions(
                      geometry: Point(
                        coordinates: Position(
                          currentLong,
                          currentLat,
                        ),
                      ),
                      circleColor: Colours.primaryBlue.toInt(),
                      circleRadius: 8,
                      circleStrokeColor: Colours.white.toInt(),
                      circleStrokeWidth: 4,
                    ));

                    // Initialize Marker
                    _pointAnnotationManager = await mapboxMap.annotations
                        .createPointAnnotationManager();
                    // await _pointAnnotationManager!.setIconAllowOverlap(false);

                    // Initialize Camera
                    await mapboxMap.setCamera(
                      CameraOptions(
                        center: Point(
                            coordinates: Position(currentLong, currentLat)),
                        zoom: 15,
                      ),
                    );

                    // Initialize Bounds on Camera
                    await mapboxMap.setBounds(CameraBoundsOptions(
                      minZoom: 5,
                      maxZoom: 18,
                    ));

                    // Remove Attribute, Logo and Scale bar
                    await mapboxMap.attribution
                        .updateSettings(AttributionSettings(enabled: false));
                    await mapboxMap.scaleBar
                        .updateSettings(ScaleBarSettings(enabled: false));
                    await mapboxMap.logo
                        .updateSettings(LogoSettings(enabled: false));

                    // Initialize Compass
                    await mapboxMap.compass.updateSettings(CompassSettings(
                      enabled: true,
                      position: OrnamentPosition.BOTTOM_LEFT,
                      marginBottom: 40,
                      marginLeft: 20,
                    ));

                    // Set Marker Locations
                    Set<String> addedCoordinates = {};

                    final annotationData =
                        <(PointAnnotationOptions, CoreSeller)>[];

                    // Load the image from assets
                    final ByteData bytes =
                        await rootBundle.load('assets/icons/map_pin_icon.png');
                    final Uint8List imageData = bytes.buffer.asUint8List();

                    for (var seller in provider.sellers!) {
                      final key =
                          "${seller.location.latitude},${seller.location.longitude}";
                      if (addedCoordinates.contains(key)) continue;

                      addedCoordinates.add(key);

                      final annotation = PointAnnotationOptions(
                        geometry: Point(
                          coordinates: Position(
                            seller.location.longitude,
                            seller.location.latitude,
                          ),
                        ),
                        image: imageData,
                        iconSize: 1,
                        iconAnchor: IconAnchor.BOTTOM,
                      );

                      annotationData.add((annotation, seller));
                    }

                    final annotations =
                        annotationData.map((e) => e.$1).toList();

                    // Create Marker
                    final createdAnnotations =
                        await _pointAnnotationManager?.createMulti(
                            annotations.cast<PointAnnotationOptions>());

                    if (createdAnnotations != null) {
                      for (int i = 0; i < createdAnnotations.length; i++) {
                        // Override ID Entity with ID from Annotation
                        _markerMapping[createdAnnotations[i]!.id] =
                            annotationData[i].$2;
                      }
                      provider.initLocations(_markerMapping.values.toList());
                    }

                    // Marker on tap listener
                    _pointAnnotationManager?.addOnPointAnnotationClickListener(
                      OnMarkerClickListener(
                        onClick: (annotation) async {
                          final screenPosition = await _mapboxMap
                              ?.pixelForCoordinate(annotation.geometry);
                          final entity = _markerMapping[annotation.id];

                          if (entity != null) {
                            _mapboxMap?.flyTo(
                              CameraOptions(
                                center: annotation.geometry,
                                zoom: 16,
                              ),
                              MapAnimationOptions(duration: 1500),
                            );

                            // save current marker
                            provider.resetMarker();
                            provider.setEntityMarker(entity);
                            provider.setNewSellerScreenPosition(screenPosition);

                            if (!context.mounted) return;
                            context.cartBloc
                                .add(const ShowSellerBottomSheetEvent());
                          }
                        },
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 40,
                  right: 20,
                  child: FloatingActionButton.small(
                    shape: const CircleBorder(),
                    heroTag: 'current-position',
                    onPressed: () async {
                      if (_mapboxMap != null) {
                        provider.resetMarker();
                        // context.immediateBookingBloc
                        //     .add(const GetCurrentPositionEvent());
                        await Future.delayed(
                          const Duration(milliseconds: 500),
                          () async {
                            if (_circleAnnotation != null) {
                              // Update new current location
                              var newPoint = Point(
                                  coordinates: Position(
                                provider.currentPosition!.longitude,
                                provider.currentPosition!.latitude,
                              ));
                              _circleAnnotation?.geometry = newPoint;
                              await _circleAnnotationManager
                                  ?.update(_circleAnnotation!);

                              // Move Camera to Current location
                              await _mapboxMap?.flyTo(
                                CameraOptions(
                                  center: Point(
                                    coordinates: Position(
                                      provider.currentPosition!.longitude,
                                      provider.currentPosition!.latitude,
                                    ),
                                  ),
                                  zoom: 15,
                                  bearing: 0,
                                ),
                                MapAnimationOptions(duration: 1500),
                              );
                            }
                          },
                        );
                      }
                    },
                    foregroundColor: Colours.white,
                    backgroundColor: Colours.primaryBlue,
                    child: const Icon(Icons.my_location),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

// create class that implements OnPointAnnotationClickListener Abstract Class
class OnMarkerClickListener implements OnPointAnnotationClickListener {
  final Function(PointAnnotation) onClick;

  OnMarkerClickListener({required this.onClick});

  @override
  void onPointAnnotationClick(PointAnnotation annotation) {
    onClick(annotation);
  }
}
