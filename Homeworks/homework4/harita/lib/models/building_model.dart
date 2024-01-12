import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum DamageType {
  heavy(color: Colors.red),
  medium(color: Colors.orange),
  light(color: Colors.green);

  final Color color;

  const DamageType({required this.color});

  String toJson() => name;
  factory DamageType.fromJson(String name) => values.byName(name);
}

class Building {
  static const String collectionName = 'buildings';

  final String? id;
  final String name;
  final LatLng location;
  final DamageType? damageType;

  const Building({
    this.id,
    required this.name,
    required this.location,
    this.damageType,
  });

  Building.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        location = LatLng.fromJson(json['location'])!,
        damageType = (json['damageType'] == null
            ? null
            : DamageType.fromJson(json['damageType']));

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'location': location.toJson(),
        'damageType': damageType?.toJson()
      };

  static CollectionReference<Map<String, dynamic>> get dbCollection =>
      FirebaseFirestore.instance.collection(collectionName);

  static Future<List<Building>> all() async => (await dbCollection.get())
      .docs
      .map((doc) => Building.fromJson(doc.data()))
      .toList();

  Future<DocumentReference<Map<String, dynamic>>> push() async =>
      await dbCollection.add(toJson());
}
