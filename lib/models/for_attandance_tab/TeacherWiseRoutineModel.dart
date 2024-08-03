// // models/schedule.dart
//
// class Schedule {
//   final String subName;
//   final String roomName;
//   final String teacherName;
//   final String paperCode;
//   final String startingTime;
//   final String endingTime;
//
//   Schedule({
//     required this.subName,
//     required this.roomName,
//     required this.teacherName,
//     required this.paperCode,
//     required this.startingTime,
//     required this.endingTime,
//   });
//
//   factory Schedule.fromJson(Map<String, dynamic> json) {
//     return Schedule(
//       subName: json['subName'],
//       roomName: json['roomName'],
//       teacherName: json['teacherName'],
//       paperCode: json['paperCode'],
//       startingTime: json['startingTime'],
//       endingTime: json['endingTime'],
//     );
//   }
// }


// models/schedule.dart

class Schedule {
  final int id;
  final String subName;
  final int subjectId;
  final String roomName;
  final String teacherName;
  final int teacherId;
  final String paperCode;
  final String startingTime;
  final String endingTime;

  Schedule({
    required this.id,
    required this.subName,
    required this.subjectId,
    required this.roomName,
    required this.teacherName,
    required this.teacherId,
    required this.paperCode,
    required this.startingTime,
    required this.endingTime,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['id'],
      subName: json['subName'],
      subjectId: json['subjectId'],
      roomName: json['roomName'],
      teacherName: json['teacherName'],
      teacherId: json['teacherId'],
      paperCode: json['paperCode'],
      startingTime: json['startingTime'],
      endingTime: json['endingTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subName': subName,
      'subjectId': subjectId,
      'roomName': roomName,
      'teacherName': teacherName,
      'teacherId': teacherId,
      'paperCode': paperCode,
      'startingTime': startingTime,
      'endingTime': endingTime,
    };
  }
}
