class NonTransportReason {
  int id;
  String nonTransportReason;

  NonTransportReason({this.id, this.nonTransportReason});

  factory NonTransportReason.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    return NonTransportReason(
        id: json['id'], nonTransportReason: json['non_transport_reason']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': this.id,
      'non_transport_reason': this.nonTransportReason
    };
  }

  factory NonTransportReason.fromName(String name) {
    Map<String, dynamic> nonTransportReasonJson = <String, dynamic>{
      "Abandonou o local": 1,
      "Decisão médica": 2,
      "Morte": 3,
      "Recusou e assinou": 4,
      "Recusou e não assinou": 5,
      "Desativação": 6,
      "": null
    };

    var id = nonTransportReasonJson[name];

    if (id != null) return NonTransportReason(id: id, nonTransportReason: name);

    return null;
  }
}
