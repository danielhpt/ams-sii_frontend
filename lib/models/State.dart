class State {
  int id;
  String state;

  State({this.id, this.state});

  factory State.fromJson(Map<String, dynamic> json) {
    return State(id: json['id'], state: json['state']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': this.id, 'state': this.state};
  }
}
