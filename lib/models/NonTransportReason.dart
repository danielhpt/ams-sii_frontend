class NonTransportReason {
  int id;
  String nonTransportReason;

  NonTransportReason({this.id, this.nonTransportReason});

  factory NonTransportReason.fromJson(Map<String, dynamic> json) {
    return NonTransportReason(
        id: json['id'],
        nonTransportReason: json['non_transport_reason']
    );
  }
}