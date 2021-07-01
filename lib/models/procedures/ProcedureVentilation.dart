class ProcedureVentilation {
  bool clearance;
  bool oropharyngeal;
  bool laryngealTube;
  bool endotracheal;
  bool laryngealMask;
  bool mechanicalVentilation;
  bool cpap;

  ProcedureVentilation(
      {this.clearance,
      this.oropharyngeal,
      this.laryngealTube,
      this.endotracheal,
      this.laryngealMask,
      this.mechanicalVentilation,
      this.cpap});

  factory ProcedureVentilation.fromJson(Map<String, dynamic> json) {
    return ProcedureVentilation(
        clearance: json['clearance'],
        oropharyngeal: json['oropharyngeal'],
        laryngealTube: json['laryngeal_tube'],
        endotracheal: json['endotracheal'],
        laryngealMask: json['laryngeal_mask'],
        mechanicalVentilation: json['mechanical_ventilation'],
        cpap: json['cpap']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'clearance': this.clearance,
      'oropharyngeal': this.oropharyngeal,
      'laryngeal_tube': this.laryngealTube,
      'endotracheal': this.endotracheal,
      'laryngeal_mask': this.laryngealMask,
      'mechanical_ventilation': this.mechanicalVentilation,
      'cpap': this.cpap
    };
  }
}
