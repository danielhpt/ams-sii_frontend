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
        cpap: json['cpap']
    );
  }
}
