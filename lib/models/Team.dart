import 'package:project/models/TeamTechnician.dart';
import 'package:project/models/User.dart';

class Team {
  int id;
  List<TeamTechnician> technicians;

  Team({this.id, this.technicians});

  factory Team.fromJson(Map<String, dynamic> json) {
    List<TeamTechnician> technicians = [];
    for (var technicianJson in json['technicians']) {
      technicians.add(TeamTechnician.fromJson(technicianJson));
    }
    return Team(id: json['id'], technicians: technicians);
  }

  factory Team.begin(User user) {
    TeamTechnician technician = TeamTechnician.fromUser(user);
    technician.isTeamLeader = true;

    List<TeamTechnician> technicians = [technician];

    return Team(id: 0, technicians: technicians);
  }

  TeamTechnician getLeader() {
    for (var technician in this.technicians) {
      if (technician.isTeamLeader) {
        return technician;
      }
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    if (technicians == null) technicians = [];
    List<Map<String, dynamic>> tJson = this.technicians.map((element) {
      return element.toJson();
    }).toList();
    return <String, dynamic>{'id': this.id, 'technicians': tJson};
  }
}
