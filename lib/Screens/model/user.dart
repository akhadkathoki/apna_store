class User {
  int user_id;
  String user_name;
  String user_phone;
  String user_email;
  String user_password;
  String user_conf_password;

  User(this.user_id, this.user_name, this.user_phone, this.user_email,
      this.user_password, this.user_conf_password);

  Map<String, dynamic> toJsom() => {
        "user_id": user_id.toString(),
        "user_name": user_name,
        "user_phone": user_phone,
        "user_email": user_email,
        "user_password": user_password,
        "user_conf_password": user_conf_password,
      };
}
