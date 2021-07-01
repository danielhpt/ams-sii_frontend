class Pharmacy {
  int id;
  DateTime time;
  String pharmacy;
  String dose;
  String route;
  String adverseEffect;

  Pharmacy(
      {this.id,
      this.time,
      this.pharmacy,
      this.dose,
      this.route,
      this.adverseEffect});

  factory Pharmacy.fromJson(Map<String, dynamic> json) {
    return Pharmacy(
        id: json['id'],
        time: DateTime.parse('2000-01-01 ' + json['time']),
        pharmacy: json['pharmacy'],
        dose: json['dose'],
        route: json['route'],
        adverseEffect: json['adverse_effect']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id == null ? 0 : this.id,
      'time': time.toString().split(' ')[1],
      'pharmacy': this.pharmacy,
      'dose': this.dose,
      'route': this.route,
      'adverse_effect': this.adverseEffect
    };
  }
}
