class DepartmentModel {
  final int id;
  final String departmentName;

  DepartmentModel({required this.id, required this.departmentName});

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      id: json['id'],
      departmentName: json['departmentName'],
    );
  }
}
