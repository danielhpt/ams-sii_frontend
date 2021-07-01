class ProcedureRCP {
  bool witnessed;

  // ignore: non_constant_identifier_names
  DateTime sbv_dae;
  String firstRhythm;
  int nrShocks;
  DateTime recovery;
  DateTime downtime;
  int mechanicalCompressions;
  bool performed;

  ProcedureRCP(
      {this.witnessed,
      // ignore: non_constant_identifier_names
      this.sbv_dae,
      this.firstRhythm,
      this.nrShocks,
      this.recovery,
      this.downtime,
      this.mechanicalCompressions,
      this.performed});

  factory ProcedureRCP.fromJson(Map<String, dynamic> json) {
    return ProcedureRCP(
        witnessed: json['witnessed'],
        sbv_dae: json['SBV_DAE'],
        firstRhythm: json['first_rhythm'],
        nrShocks: json['nr_shocks'],
        recovery: json['recovery'],
        downtime: json['downtime'],
        mechanicalCompressions: json['mechanical_compressions'],
        performed: json['performed']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'witnessed': this.witnessed,
      'sbv_dae': this.sbv_dae,
      'first_rhythm': this.firstRhythm,
      'nr_shocks': this.nrShocks,
      'recovery': this.recovery,
      'downtime': this.downtime,
      'mechanical_compressions': this.mechanicalCompressions,
      'performed': this.performed
    };
  }
}
