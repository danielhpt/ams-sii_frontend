class TypeOfTransport {
  int id;
  String typeOfTransport;

  TypeOfTransport({this.id, this.typeOfTransport});

  factory TypeOfTransport.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    return TypeOfTransport(
        id: json['id'], typeOfTransport: json['type_of_transport']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': this.id,
      'type_of_transport': this.typeOfTransport
    };
  }

  factory TypeOfTransport.fromName(String name) {
    Map<String, dynamic> typeOfTransportJson = <String, dynamic>{
      "Primário": 1,
      "Secundário": 2,
      "Não Transporte": 3,
      "": null
    };

    var id = typeOfTransportJson[name];

    if (id != null) return TypeOfTransport(id: id, typeOfTransport: name);

    return null;
  }
}
