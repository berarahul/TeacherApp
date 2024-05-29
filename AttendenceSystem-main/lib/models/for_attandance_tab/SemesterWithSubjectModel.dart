class Semesterwithsubjectmodel {
  final int subjectId;
  final int semester;
  final String subjectName;

  Semesterwithsubjectmodel({
    required this.subjectId,
    required this.semester,
    required this.subjectName,
  });

  factory Semesterwithsubjectmodel.fromJson(Map<String, dynamic> json) {
    return Semesterwithsubjectmodel(
      subjectId: json['subjectId'] as int,
      semester: json['semester'] as int,
      subjectName: json['subjectName'] as String,
    );
  }
}
