class TypeOfTransport {
  int id;
  String typeOfTransport;

  TypeOfTransport({this.id, this.typeOfTransport});

  factory TypeOfTransport.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    return TypeOfTransport(
        id: json['id'],
        typeOfTransport: json['type_of_transport']
    );
  }
}