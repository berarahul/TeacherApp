class StudentDataModel {
  String name;
  int rollNumber;
  bool isPresent = false;

  StudentDataModel({required this.name, required this.rollNumber});

  factory StudentDataModel.fromJson(Map<String, dynamic> json) {
    return StudentDataModel(
      name: json['name'],
      rollNumber: json['roll'],
    );
  }
}