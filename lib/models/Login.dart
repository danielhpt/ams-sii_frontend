class Login {
  String username;
  String password;

  Login({this.username, this.password});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': this.username,
      'password': this.password
    };
  }
}
