import 'package:project/models/Evaluation.dart';
import 'package:project/models/NonTransportReason.dart';
import 'package:project/models/Occurrence.dart';
import 'package:project/models/Pharmacy.dart';
import 'package:project/models/procedures/ProcedureCirculation.dart';
import 'package:project/models/procedures/ProcedureProtocol.dart';
import 'package:project/models/procedures/ProcedureRCP.dart';
import 'package:project/models/procedures/ProcedureScale.dart';
import 'package:project/models/procedures/ProcedureVentilation.dart';
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
    TypeOfTransport typeOfTransport =  TypeOfTransport.fromJson(json['type_of_transport']);
    NonTransportReason nonTransportReason = NonTransportReason.fromJson(json['non_transport_reason']);
    Occurrence occurrence = Occurrence.fromJsonSimplified(json['occurrence']);

    return Victim(
        id: json['id'],
        name: json['name'],
        birthdate: DateTime.parse(json['birthdate'] + ' 00:00:00'),
        age: json['age'],
        gender: json['gender'],
        identityNumber: json['identity_number'],
        address: json['address'],
        circumstances: json['circumstances'],
        diseaseHistory: json['disease_history'],
        allergies: json['allergies'],
        lastMeal: json['last_meal'],
        lastMealTime: DateTime.parse(json['last_meal_time']),
        usualMedication: json['usual_medication'],
        riskSituation: json['risk_situation'],
        medicalFollowup: json['medical_followup'],
        healthUnitOrigin: json['health_unit_origin'],
        healthUnitDestination: json['health_unit_destination'],
        episodeNumber: json['episode_number'],
        typeOfTransport: typeOfTransport,
        nonTransportReason: nonTransportReason,
        comments: json['comments'],
        typeOfEmergency: json['type_of_emergency'],
        siv_sav: DateTime.parse(json['SIV_SAV']),
        occurrence: occurrence,
        evaluations: null,
        pharmacies: null,
        procedureRCP: null,
        procedureVentilation: null,
        procedureProtocol: null,
        procedureCirculation: null,
        procedureScale: null,
        symptom: null);
  }

  factory Victim.fromJsonCompleted(Map<String, dynamic> json) {
    TypeOfTransport typeOfTransport =  TypeOfTransport.fromName(json['type_of_transport']);
    NonTransportReason nonTransportReason = NonTransportReason.fromName(json['non_transport_reason']);
    Occurrence occurrence = Occurrence.fromJsonSimplified(json['occurrence']);

    return Victim(
        id: json['id'],
        name: json['name'],
        birthdate: DateTime.parse(json['birthdate'] + ' 00:00:00'),
        age: json['age'],
        gender: json['gender'],
        identityNumber: json['identity_number'],
        address: json['address'],
        circumstances: json['circumstances'],
        diseaseHistory: json['disease_history'],
        allergies: json['allergies'],
        lastMeal: json['last_meal'],
        lastMealTime: DateTime.parse(json['last_meal_time']),
        usualMedication: json['usual_medication'],
        riskSituation: json['risk_situation'],
        medicalFollowup: json['medical_followup'],
        healthUnitOrigin: json['health_unit_origin'],
        healthUnitDestination: json['health_unit_destination'],
        episodeNumber: json['episode_number'],
        typeOfTransport: typeOfTransport,
        nonTransportReason: nonTransportReason,
        comments: json['comments'],
        typeOfEmergency: json['type_of_emergency'],
        siv_sav: DateTime.parse(json['SIV_SAV']),
        occurrence: occurrence,
        evaluations: null,
        pharmacies: null,
        procedureRCP: null,
        procedureVentilation: null,
        procedureProtocol: null,
        procedureCirculation: null,
        procedureScale: null,
        symptom: null);
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
    victim.procedureVentilation =
        ProcedureVentilation.fromJson(json['procedure_ventilation']);
    victim.procedureCirculation =
        ProcedureCirculation.fromJson(json['procedure_circulation']);
    victim.procedureProtocol =
        ProcedureProtocol.fromJson(json['procedure_protocol']);
    victim.procedureScale = ProcedureScale.fromJson(json['procedure_scale']);

    return victim;
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> eJson = this.evaluations.map((element) {
      return element.toJson();
    }).toList();

    List<Map<String, dynamic>> pJson = this.pharmacies.map((element) {
      return element.toJson();
    }).toList();

    return <String, dynamic>{
      'id': this.id == null ? 0 : this.id,
      'name': this.name,
      'birthdate': birthdate.toString().split(' ')[0],
      'age': this.age,
      'gender': this.gender,
      'identity_number': this.identityNumber,
      'address': this.address,
      'circumstances': this.circumstances,
      'disease_history': this.diseaseHistory,
      'allergies': this.allergies,
      'last_meal': this.lastMeal,
      'last_meal_time': lastMealTime.toString(),
      'usual_medication': this.usualMedication,
      'risk_situation': this.riskSituation,
      'medical_followup': this.medicalFollowup,
      'health_unit_origin': this.healthUnitOrigin,
      'health_unit_destination': this.healthUnitDestination,
      'episode_number': this.episodeNumber,
      'comments': this.comments,
      'type_of_emergency': this.typeOfEmergency,
      'SIV_SAV': this.siv_sav.toString(),
      'type_of_transport': typeOfTransport == null ? null : typeOfTransport.toJson(),
      'non_transport_reason': nonTransportReason == null ? null : nonTransportReason.toJson(),
      'evaluations': eJson,
      'pharmacies': pJson,
      'occurrence': occurrence == null ? null : occurrence.toJson(),
      'procedure_rcp': procedureRCP == null ? null : procedureRCP.toJson(),
      'procedure_ventilation': procedureVentilation == null ? null : procedureVentilation.toJson(),
      'procedure_circulation': procedureCirculation == null ? null : procedureCirculation.toJson(),
      'procedure_protocol': procedureProtocol == null ? null : procedureProtocol.toJson(),
      'procedure_scale': procedureScale == null ? null : procedureScale.toJson(),
      'symptom': symptom == null ? null : symptom.toJson()
    };
  }
}
