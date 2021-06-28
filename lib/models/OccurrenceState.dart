import 'package:project/models/State.dart';

class OccurrenceState {
  int id;
  double longitude;
  double latitude;
  DateTime dateTime;
  State state;

  OccurrenceState(
      {this.id, this.longitude, this.latitude, this.dateTime, this.state});

  factory OccurrenceState.fromJson(Map<String, dynamic> json) {
    State state = State.fromJson(json['state']);
    return OccurrenceState(
      id: json['id'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      dateTime: DateTime.parse(json['date_time']),
      state: state
    );
  }
}