class Holiday {
  final int id;
  final String reason;
  final String startDate;
  final String endDate;

  Holiday({
    required this.id,
    required this.reason,
    required this.startDate,
    required this.endDate,
  });

  factory Holiday.fromJson(Map<String, dynamic> json) {
    return Holiday(
      id: json['id'],
      reason: json['reason'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }
}