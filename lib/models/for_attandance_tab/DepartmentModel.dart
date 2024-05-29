
class DepartmentModel {
  final int id;
  final String departmentName;
  String? teacherId;

  DepartmentModel({required this.id, required this.departmentName, this.teacherId});

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      id: json['id'],
      departmentName: json['departmentName'],
      teacherId: json['teacherId'],
    );
  }
  toJson() {
    return {
      'id': id,
      'departmentName': departmentName,
      'teacherId': teacherId
    };
  }
}
