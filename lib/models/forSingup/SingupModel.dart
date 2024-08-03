class TeacherRegistration {

  String name;
  String username;
  String password;
  String confirmPassword;
  String idCardNumber;

  TeacherRegistration({

    required this.name,
    required this.username,
    required this.password,
    required this.confirmPassword,
    required this.idCardNumber,
  });

  // JSON se object create karne ke liye
  factory TeacherRegistration.fromJson(Map<String, dynamic> json) {
    return TeacherRegistration(

      name: json['name'],
      username: json['username'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
      idCardNumber: json['idCardNumber'],
    );
  }

  // Object ko JSON mein convert karne ke liye
  Map<String, dynamic> toJson() {
    return {

      'name': name,
      'username': username,
      'password': password,
      'confirmPassword': confirmPassword,
      'idCardNumber': idCardNumber,
    };
  }
}
