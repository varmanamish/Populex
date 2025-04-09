class LawUser {
  String fullName;
  String phone;
  String username;
  String email;
  String password;
  String confirmPassword;
  bool isLawStudent;
  String? collegeName;
  String? studentId;
  String? yearOfStudy;
  String? fieldOfInterest;

  LawUser({
    required this.fullName,
    required this.phone,
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.isLawStudent,
    this.collegeName,
    this.studentId,
    this.yearOfStudy,
    this.fieldOfInterest,
  });

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'phone': phone,
        'username': username,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'isLawStudent': isLawStudent,
        'collegeName': collegeName,
        'studentId': studentId,
        'yearOfStudy': yearOfStudy,
        'fieldOfInterest': fieldOfInterest,
      };
}
