import 'package:project/models/User.dart';

class TeamTechnician {
  int id;
  String username;
  String firstName;
  String lastName;
  bool isActive;
  bool isTeamLeader;

  TeamTechnician(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.isActive,
      this.isTeamLeader});

  factory TeamTechnician.fromJson(Map<String, dynamic> json) {
    return TeamTechnician(
        id: json['id'],
        username: json['username'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        isActive: json['active'],
        isTeamLeader: json['team_leader']);
  }

  factory TeamTechnician.fromUser(User user) {
    return TeamTechnician(
        id: user.id,
        username: user.username,
        firstName: user.firstName,
        lastName: user.lastName,
        isTeamLeader: false,
        isActive: true);
  }

  getFullName() => this.firstName + ' ' + this.lastName;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': this.id,
      'username': this.username,
      'first_name': this.firstName,
      'last_name': this.lastName,
      'active': this.isActive,
      'team_leader': this.isTeamLeader
    };
  }
}
