class Pharmacy {
  int id;
  DateTime time;
  String pharmacy;
  String dose;
  String route;
  String adverseEffect;

  Pharmacy({this.id, this.time, this.pharmacy, this.dose, this.route, this.adverseEffect});

  factory Pharmacy.fromJson(Map<String, dynamic> json) {
    return Pharmacy(
      id: json['id'],
      time: DateTime.parse(json['time']),
      pharmacy: json['pharmacy'],
      dose: json['dose'],
      route: json['route'],
      adverseEffect: json['adverse_effect']
    );
  }
}