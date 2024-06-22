class AttendanceResponse {
  final int totalClass;
  final List<StudentAttendance> studentsAttendanceList;

  AttendanceResponse({
    required this.totalClass,
    required this.studentsAttendanceList,
  });

  factory AttendanceResponse.fromJson(Map<String, dynamic> json) {
    return AttendanceResponse(
      totalClass: json['totalClass'],
      studentsAttendanceList: List<StudentAttendance>.from(
        json['studentsAttendanceList'].map((x) => StudentAttendance.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalClass': totalClass,
      'studentsAttendanceList': studentsAttendanceList.map((x) => x.toJson()).toList(),
    };
  }
}

class StudentAttendance {
  final int roll;
  final String name;
  final int attendance;

  StudentAttendance({
    required this.roll,
    required this.name,
    required this.attendance,
  });

  factory StudentAttendance.fromJson(Map<String, dynamic> json) {
    return StudentAttendance(
      roll: json['roll'],
      name: json['name'],
      attendance: json['attendance'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roll': roll,
      'name': name,
      'attendance': attendance,
    };
  }
}
