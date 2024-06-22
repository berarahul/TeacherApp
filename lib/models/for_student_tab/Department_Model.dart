class StudentTabDepartmentModel {
  final int id;
  final String departmentName;

  StudentTabDepartmentModel({required this.id, required this.departmentName});

  factory StudentTabDepartmentModel.fromJson(Map<String, dynamic> json) {
    return StudentTabDepartmentModel(
      id: json['id'],
      departmentName: json['departmentName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'departmentName': departmentName,
    };
  }
}
