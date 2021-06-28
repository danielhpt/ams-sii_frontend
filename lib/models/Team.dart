import 'package:project/models/TeamTechnician.dart';

class Team {
  int id;
  List<TeamTechnician> technicians;

  Team({this.id, this.technicians});

  factory Team.fromJson(Map<String, dynamic> json) {
    List<TeamTechnician> technicians;
    for (var technicianJson in json['technicians']) {
      technicians.add(TeamTechnician.fromJson(technicianJson));
    }
    return Team(
      id: json['id'],
      technicians: technicians
    );
  }

  TeamTechnician getLeader() {
    for (var technician in this.technicians) {
      if (technician.isTeamLeader) {
        return technician;
      }
    }
    return null;
  }
}