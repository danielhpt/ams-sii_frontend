import 'package:project/models/Evaluation.dart';
import 'package:project/models/NonTransportReason.dart';
import 'package:project/models/Occurrence.dart';
import 'package:project/models/Pharmacy.dart';
import 'package:project/models/ProcedureCirculation.dart';
import 'package:project/models/ProcedureProtocol.dart';
import 'package:project/models/ProcedureRCP.dart';
import 'package:project/models/ProcedureScale.dart';
import 'package:project/models/ProcedureVentilation.dart';
import 'package:project/models/Symptom.dart';
import 'package:project/models/TypeOfTransport.dart';

class Victim {
  int id;
  String name;
  DateTime birthdate;
  int age;
  String gender;
  String identityNumber;
  String address;
  String circumstances;
  String diseaseHistory;
  String allergies;
  String lastMeal;
  DateTime lastMealTime;
  String usualMedication;
  String riskSituation;
  bool medicalFollowup;
  String healthUnitOrigin;
  String healthUnitDestination;
  int episodeNumber;
  String comments;
  String typeOfEmergency;
  // ignore: non_constant_identifier_names
  DateTime siv_sav;

  TypeOfTransport typeOfTransport;
  NonTransportReason nonTransportReason;
  Occurrence occurrence;

  List<Evaluation> evaluations;
  List<Pharmacy> pharmacies;
  ProcedureRCP procedureRCP;
  ProcedureVentilation procedureVentilation;
  ProcedureProtocol procedureProtocol;
  ProcedureCirculation procedureCirculation;
  ProcedureScale procedureScale;
  Symptom symptom;

  Victim(
      {this.id,
      this.name,
      this.birthdate,
      this.age,
      this.gender,
      this.identityNumber,
      this.address,
      this.circumstances,
      this.diseaseHistory,
      this.allergies,
      this.lastMeal,
      this.lastMealTime,
      this.usualMedication,
      this.riskSituation,
      this.medicalFollowup,
      this.healthUnitOrigin,
      this.healthUnitDestination,
      this.episodeNumber,
      this.comments,
      this.typeOfEmergency,
        // ignore: non_constant_identifier_names
      this.siv_sav,
      this.typeOfTransport,
      this.nonTransportReason,
      this.occurrence,
      this.evaluations,
      this.pharmacies,
      this.procedureRCP,
      this.procedureVentilation,
      this.procedureProtocol,
      this.procedureCirculation,
      this.procedureScale,
      this.symptom});

  factory Victim.fromJson(Map<String, dynamic> json) {
    TypeOfTransport typeOfTransport = TypeOfTransport.fromJson(json['type_of_transport']);
    NonTransportReason nonTransportReason = NonTransportReason.fromJson(json['non_transport_reason']);
    Occurrence occurrence = Occurrence.fromJsonSimplified(json['occurrence']);

    return Victim(
      id: json['id'],
      name: json['name'],
      birthdate: json['birthdate'],
      age: json['age'],
      gender: json['gender'],
      identityNumber: json['identity_number'],
      address: json['address'],
      circumstances: json['circumstances'],
      diseaseHistory: json['disease_history'],
      allergies: json['allergies'],
      lastMeal: json['last_meal'],
      lastMealTime: json['last_meal_time'],
      usualMedication: json['usual_medication'],
      riskSituation: json['risk_situation'],
      medicalFollowup: json['medical_followup'],
      healthUnitOrigin: json['health_unit_origin'],
      healthUnitDestination: json['health_unit_destination'],
      episodeNumber: json['episode_number'],
      comments: json['comments'],
      typeOfEmergency: json['type_of_emergency'],
      siv_sav: json['SIV_SAV'],
      typeOfTransport: typeOfTransport,
      nonTransportReason: nonTransportReason,
      occurrence: occurrence,
      evaluations: null,
      pharmacies: null,
      procedureRCP: null,
      procedureVentilation: null,
      procedureProtocol: null,
      procedureCirculation: null,
      procedureScale: null,
      symptom: null
    );
  }

  factory Victim.fromJsonDetail(Map<String, dynamic> json) {
    Victim victim = Victim.fromJson(json);

    List<Evaluation> evaluations = [];
    for (var evaluationJson in json['evaluations']) {
      evaluations.add(Evaluation.fromJson(evaluationJson));
    }
    victim.evaluations = evaluations;
    
    List<Pharmacy> pharmacies = [];
    for (var pharmacyJson in json['pharmacies']) {
      pharmacies.add(Pharmacy.fromJson(pharmacyJson));
    }
    victim.pharmacies = pharmacies;

    victim.symptom = Symptom.fromJson(json['symptom']);
    victim.procedureRCP = ProcedureRCP.fromJson(json['procedure_rcp']);
    victim.procedureVentilation = ProcedureVentilation.fromJson(json['procedure_ventilation']);
    victim.procedureCirculation = ProcedureCirculation.fromJson(json['procedure_circulation']);
    victim.procedureProtocol = ProcedureProtocol.fromJson(json['procedure_protocol']);
    victim.procedureScale = ProcedureScale.fromJson(json['procedure_scale']);

    return victim;
  }
}