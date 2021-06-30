import 'package:project/models/OccurrenceState.dart';
import 'package:project/models/Team.dart';
import 'package:project/models/Victim.dart';

class Occurrence {
  int id;
  int occurrenceNumber;
  String entity;
  String meanOfAssistance;
  String motive;
  int numberOfVictims;
  String local;
  String parish;
  String municipality;
  Team team;
  List<Victim> victims;
  List<OccurrenceState> states;

  Occurrence(
      {this.id,
      this.occurrenceNumber,
      this.entity,
      this.meanOfAssistance,
      this.motive,
      this.numberOfVictims,
      this.local,
      this.parish,
      this.municipality,
      this.team,
      this.victims,
      this.states});

  factory Occurrence.fromJsonSimplified(Map<String, dynamic> json) {
    return Occurrence(
      id: json['id'],
      occurrenceNumber: json['occurrence_number'],
      entity: null,
      meanOfAssistance: null,
      motive: null,
      numberOfVictims: null,
      local: null,
      parish: null,
      municipality: null,
      team: null,
      victims: null,
      states: null,
    );
  }

  factory Occurrence.fromJson(Map<String, dynamic> json) {
    Team team = Team.fromJson(json['team']);
    return Occurrence(
      id: json['id'],
      occurrenceNumber: json['occurrence_number'],
      entity: json['entity'],
      meanOfAssistance: json['mean_of_assistance'],
      motive: json['motive'],
      numberOfVictims: json['number_of_victims'],
      local: json['local'],
      parish: json['parish'],
      municipality: json['municipality'],
      team: team,
      victims: null,
      states: null,
    );
  }

  factory Occurrence.fromJsonDetail(Map<String, dynamic> json) {
    Occurrence occurrence = Occurrence.fromJson(json);

    List<Victim> victims = [];
    for (var victimJson in json['victims']) {
      victims.add(Victim.fromJson(victimJson));
    }
    occurrence.victims = victims;

    List<OccurrenceState> states = [];
    for (var stateJson in json['states']) {
      states.add(OccurrenceState.fromJson(stateJson));
    }
    occurrence.states = states;

    return occurrence;
  }
}

