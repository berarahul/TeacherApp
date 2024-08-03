class SubjectModel {
  final int subjectId;
  final int semester;
  final String subjectName;

  SubjectModel({
    required this.subjectId,
    required this.semester,
    required this.subjectName,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      subjectId: json['subjectId'],
      semester: json['semester'],
      subjectName: json['subjectName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subjectId': subjectId,
      'semester': semester,
      'subjectName': subjectName,
    };
  }
}
