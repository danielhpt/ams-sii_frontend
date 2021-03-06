class ProcedureCirculation {
  bool temperatureMonitoring;
  bool compression;
  bool tourniquet;
  bool pelvicBelt;
  bool venousAccess;
  bool patch;
  bool ecg;

  ProcedureCirculation(
      {this.temperatureMonitoring,
      this.compression,
      this.tourniquet,
      this.pelvicBelt,
      this.venousAccess,
      this.patch,
      this.ecg});

  factory ProcedureCirculation.fromJson(Map<String, dynamic> json) {
    return ProcedureCirculation(
        temperatureMonitoring: json['temperature_monitoring'],
        compression: json['compression'],
        tourniquet: json['tourniquet'],
        pelvicBelt: json['pelvic_belt'],
        venousAccess: json['venous_access'],
        patch: json['patch'],
        ecg: json['ecg']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'temperature_monitoring': temperatureMonitoring,
      'compression': this.compression,
      'tourniquet': this.tourniquet,
      'pelvic_belt': this.pelvicBelt,
      'venous_access': this.venousAccess,
      'patch': this.patch,
      'ecg': this.ecg
    };
  }
}
