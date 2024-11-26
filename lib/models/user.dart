class Users {
  int user_id;
  String user_name;
  String user_phone;
  String user_email;
  String user_password;

  Users({
    required this.user_id,
    required this.user_name,
    required this.user_phone,
    required this.user_email,
    required this.user_password,
  });

  // Convert Firestore document to User object
  factory Users.fromMap(Map<String, dynamic> data) {
    return Users(
      user_id: int.tryParse(data['user_id'] ?? '0') ?? 0,
      user_name: data['user_name'] ?? '',
      user_phone: data['user_phone'] ?? '',
      user_email: data['user_email'] ?? '',
      user_password: data['user_password'] ?? '',
    );
  }
}
