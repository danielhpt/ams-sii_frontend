class TypeOfTransport {
  int id;
  String typeOfTransport;

  TypeOfTransport({this.id, this.typeOfTransport});

  factory TypeOfTransport.fromJson(Map<String, dynamic> json) {
    return TypeOfTransport(
        id: json['id'],
        typeOfTransport: json['type_of_transport']
    );
  }
}