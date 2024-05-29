

class studenttabDepartmentModel {
  final int id;
  final String departmentName;

  studenttabDepartmentModel({required this.id, required this.departmentName});

  factory studenttabDepartmentModel.fromJson(Map<String, dynamic> json) {
    return studenttabDepartmentModel(
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
