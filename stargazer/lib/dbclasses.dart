class Star {
  final int id;
  final String name;
  final String description;

  const Star({
    required this.id,
    required this.name,
    required this.description,
  });

  // Convert a Star into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  static Star fromJson(Map<String, Object?> json) => Star(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String);

  // Implement toString to make it easier to see information about
  // each star when using the print statement.
  @override
  String toString() {
    return 'Star{id: $id, name: $name, description: $description}';
  }
}
