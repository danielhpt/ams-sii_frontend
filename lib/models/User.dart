class User {
  int id;
  String username;
  String firstName;
  String lastName;
  String email;

  User({this.id, this.username, this.firstName, this.lastName, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email']);
  }

  getFullName() => this.firstName + ' ' + this.lastName;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': this.id,
      'username': this.username,
      'first_name': this.firstName,
      'last_name': this.lastName,
      'email': this.email
    };
  }
}
