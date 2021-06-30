class TeamTechnician {
  int id;
  String username;
  String firstName;
  String lastName;
  bool isActive;
  bool isTeamLeader;

  TeamTechnician({this.id, this.username, this.firstName, this.lastName, this.isActive, this.isTeamLeader});

  factory TeamTechnician.fromJson(Map<String, dynamic> json) {
    return TeamTechnician(
        id: json['id'],
        username: json['username'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        isActive: json['active'],
        isTeamLeader: json['team_leader']
    );
  }

  getFullName() => this.firstName + ' ' + this.lastName;
}