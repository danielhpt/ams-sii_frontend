class ProcedureScale {
  int cincinatti;
  int proacs;
  int rts;
  int mgap;
  int race;

  ProcedureScale(
      {this.cincinatti, this.proacs, this.rts, this.mgap, this.race});

  factory ProcedureScale.fromJson(Map<String, dynamic> json) {
    return ProcedureScale(
        cincinatti: json['cincinatti'],
        proacs: json['PROACS'],
        rts: json['RTS'],
        mgap: json['MGAP'],
        race: json['RACE']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cincinatti': this.cincinatti,
      'proacs': this.proacs,
      'rts': this.rts,
      'mgap': this.mgap,
      'race': this.race
    };
  }
}
