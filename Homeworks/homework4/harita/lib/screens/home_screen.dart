import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_odev/models/building_model.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Building.all().then((buildings) {
      var fetchedPolygons = buildings
          .map((building) => createPolygon(
                building.location,
                building.damageType ?? DamageType.medium,
              ))
          .toSet();

      var fetchedMarkers = buildings
          .map((building) => createMarker(
                building.location,
                building.name,
              ))
          .toSet();

      setState(() {
        polygons.addAll(fetchedPolygons);
        markers.addAll(fetchedMarkers);
      });
    });
  }

  Polygon createPolygon(LatLng latLng, DamageType damageType) {
    const size = 0.0005;

    return Polygon(
      polygonId: PolygonId(const Uuid().v4()),
      points: [
        LatLng(latLng.latitude + size, latLng.longitude + size),
        LatLng(latLng.latitude + size, latLng.longitude - size),
        LatLng(latLng.latitude - size, latLng.longitude - size),
        LatLng(latLng.latitude - size, latLng.longitude + size),
      ],
      fillColor: damageType.color.withOpacity(0.3),
      strokeColor: damageType.color,
      strokeWidth: 2,
    );
  }

  Marker createMarker(LatLng latLng, String name) {
    return Marker(
      markerId: MarkerId(const Uuid().v4()),
      position: latLng,
      alpha: 0.8,
      infoWindow: InfoWindow(
        title: name,
      ),
    );
  }

  bool isDialogOpen = false;

  Set<Marker> markers = {};
  Set<Polygon> polygons = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Selahaddin kenco",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: LatLng(37.7749, -122.4194),
            zoom: 14,
          ),
          markers: markers,
          polygons: polygons,
          onTap: (LatLng latLng) async {
            if (isDialogOpen) return;

            setState(() {
              isDialogOpen = true;
            });

            showDialog(
              context: context,
              builder: (BuildContext context) {
                String placeName = '';
                DamageType damageType = DamageType.medium;

                return AlertDialog(
                  title: const Text('Add place'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        onChanged: (value) {
                          placeName = value;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                      const SizedBox(height: 20),
                      DropdownButtonFormField<DamageType>(
                        value: damageType,
                        onChanged: (DamageType? value) {
                          damageType = value!;
                        },
                        items: DamageType.values
                            .map((damageType) => DropdownMenuItem(
                                  value: damageType,
                                  child: Text(damageType.name),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      child: const Text('Add'),
                      onPressed: () async {
                        setState(() {
                          polygons.add(createPolygon(latLng, damageType));
                          markers.add(createMarker(latLng, placeName));
                        });

                        await Building(
                          name: placeName,
                          location: latLng,
                          damageType: damageType,
                        ).push();

                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            ).whenComplete(() async {
              await Future.delayed(const Duration(milliseconds: 500));

              setState(() {
                isDialogOpen = false;
              });
            });
          },
        ));
  }
}
