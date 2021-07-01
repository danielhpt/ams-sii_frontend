class Evaluation {
  int id;
  DateTime hours;
  int avds;
  int ventilation;
  int spo2;
  int o2;
  int etco2;
  int pulse;
  bool ecg;
  String skin;
  double temperature;
  int systolicBloodPressure;
  int diastolicBloodPressure;
  String pupils;
  int pain;
  int glycemia;
  int news;

  Evaluation(
      {this.id,
      this.hours,
      this.avds,
      this.ventilation,
      this.spo2,
      this.o2,
      this.etco2,
      this.pulse,
      this.ecg,
      this.skin,
      this.temperature,
      this.systolicBloodPressure,
      this.diastolicBloodPressure,
      this.pupils,
      this.pain,
      this.glycemia,
      this.news});

  factory Evaluation.fromJson(Map<String, dynamic> json) {
    return Evaluation(
        id: json['id'],
        hours: DateTime.parse(json['hours']),
        avds: json['avds'],
        ventilation: json['ventilation'],
        spo2: json['spo2'],
        o2: json['o2'],
        etco2: json['etco2'],
        pulse: json['pulse'],
        ecg: json['ecg'],
        skin: json['skin'],
        temperature: json['temperature'] == null ? null : double.parse(json['temperature']),
        systolicBloodPressure: json['systolic_blood_pressure'],
        diastolicBloodPressure: json['diastolic_blood_pressure'],
        pupils: json['pupils'],
        pain: json['pain'],
        glycemia: json['glycemia'],
        news: json['news']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id == null ? 0 : this.id,
      'hours': this.hours.toString(),
      'avds': this.avds,
      'ventilation': this.ventilation,
      'spo2': this.spo2,
      'o2': this.o2,
      'etco2': this.etco2,
      'pulse': this.pulse,
      'ecg': this.ecg,
      'skin': this.skin,
      'temperature': this.temperature,
      'systolic_blood_pressure': this.systolicBloodPressure,
      'diastolic_blood_pressure': this.diastolicBloodPressure,
      'pupils': this.pupils,
      'pain': this.pain,
      'glycemia': this.glycemia,
      'news': this.news
    };
  }
}
