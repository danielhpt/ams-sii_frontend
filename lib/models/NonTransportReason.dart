class NonTransportReason {
  int id;
  String nonTransportReason;

  NonTransportReason({this.id, this.nonTransportReason});

  factory NonTransportReason.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    return NonTransportReason(
        id: json['id'],
        nonTransportReason: json['non_transport_reason']
    );
  }
}