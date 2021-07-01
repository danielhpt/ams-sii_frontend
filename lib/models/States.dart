class States {
  int id;
  String state;

  States({this.id, this.state});

  factory States.fromJson(Map<String, dynamic> json) {
    return States(id: json['id'], state: json['state']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': this.id, 'state': this.state};
  }
}
