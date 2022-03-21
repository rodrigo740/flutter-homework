import 'dart:convert';
import 'dart:ui';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';

class Star {
  final int id;
  final String name;
  final String description;
  final String image;

  const Star(
      {required this.id,
      required this.name,
      required this.description,
      required this.image});

  // Convert a Star into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'description': description, 'image': image};
  }

  static Star fromJson(Map<String, Object?> json) => Star(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String);

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }

  // Implement toString to make it easier to see information about
  // each star when using the print statement.
  @override
  String toString() {
    return 'Star{id: $id, name: $name, description: $description, image: $image}';
  }
}
