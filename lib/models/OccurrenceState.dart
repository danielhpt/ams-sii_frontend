import 'package:project/models/States.dart';

class OccurrenceState {
  int id;
  double longitude;
  double latitude;
  DateTime dateTime;
  States state;

  OccurrenceState(
      {this.id, this.longitude, this.latitude, this.dateTime, this.state});

  factory OccurrenceState.fromJson(Map<String, dynamic> json) {
    States state = States.fromJson(json['state']);
    return OccurrenceState(
        id: json['id'],
        latitude: double.parse(json['latitude']),
        longitude: double.parse(json['longitude']),
        dateTime: DateTime.parse(json['date_time']),
        state: state);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': this.id,
      'longitude': this.longitude,
      'latitude': this.latitude,
      'date_time': dateTime.toString(),
      'state': state.toJson()
    };
  }
}
