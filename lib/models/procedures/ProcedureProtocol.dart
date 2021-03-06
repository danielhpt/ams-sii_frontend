class ProcedureProtocol {
  bool immobilization;
  bool teph;
  bool siv;

  // ignore: non_constant_identifier_names
  bool vv_avc;

  // ignore: non_constant_identifier_names
  bool vv_coronary;

  // ignore: non_constant_identifier_names
  bool vv_sepsis;

  // ignore: non_constant_identifier_names
  bool vv_trauma;

  // ignore: non_constant_identifier_names
  bool vv_pcr;

  ProcedureProtocol(
      {this.immobilization,
      this.teph,
      this.siv,
      // ignore: non_constant_identifier_names
      this.vv_avc,
      // ignore: non_constant_identifier_names
      this.vv_coronary,
      // ignore: non_constant_identifier_names
      this.vv_sepsis,
      // ignore: non_constant_identifier_names
      this.vv_trauma,
      // ignore: non_constant_identifier_names
      this.vv_pcr});

  factory ProcedureProtocol.fromJson(Map<String, dynamic> json) {
    return ProcedureProtocol(
        immobilization: json['immobilization'],
        teph: json['TEPH'],
        siv: json['SIV'],
        vv_avc: json['VV_AVC'],
        vv_coronary: json['VV_coronary'],
        vv_sepsis: json['VV_sepsis'],
        vv_trauma: json['VV_trauma'],
        vv_pcr: json['VV_PCR']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'immobilization': this.immobilization,
      'teph': this.teph,
      'siv': this.siv,
      'vv_avc': this.vv_avc,
      'vv_coronary': this.vv_coronary,
      'vv_sepsis': this.vv_sepsis,
      'vv_trauma': this.vv_trauma,
      'vv_pcr': this.vv_pcr
    };
  }
}
