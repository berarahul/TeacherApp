// Subject.dart
class Subject {
  final int id;
  final String name;
  final int semesterId;

  Subject({required this.id, required this.name, required this.semesterId});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      semesterId: json['semesterId'] ?? 0,
    );
  }

  @override
  String toString() => 'Subject(id: $id, name: $name, semesterId: $semesterId)';
}

// Semester.dart
class Semester {
  final int id;
  final String name;

  Semester({required this.id, required this.name});

  factory Semester.fromJson(Map<String, dynamic> json) {
    return Semester(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  String toString() => 'Semester(id: $id, name: $name)';
}
