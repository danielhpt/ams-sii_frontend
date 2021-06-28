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
  DateTime SIV_SAV;

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

  factory Victim.fromJson(Map<String, dynamic> json){
    TypeOfTransport typeOfTransport = TypeOfTransport.fromJson(json['type_of_transport']);
    NonTransportReason nonTransportReason = NonTransportReason.fromJson(json['non_transport_reason']);
    Occurrence occurrence = Occurrence.fromJsonSimplified(json['occurrence']);

    return null;
  }
}

// *name Text
// *birthdate Date
// *age int
// *gender Text
// *identity_number Text
// *address Text
// *circumstances Text
// *disease_history Text
// *allergies Text
// *last_meal Text
// *last_meal_time DateTime
// *usual_medication Text
// *risk_situation Text
// *medical_followup Boolean
// *health_unit_origin Text
// *health_unit_destination Text
// *episode_number int
// *comments Text
// *type_of_emergency Text
// *SIV_SAV DateTime
//
// *Type_Of_Transport
// *Non_Transport_Reason
// *Occurrence
//
// ---Details
// evaluations = EvaluationSerializer(read_only=True, many=True)
// pharmacies = PharmacySerializer(many=True, read_only=True)
// procedure_rcp = ProcedureRCPSerializer(read_only=True)
// procedure_ventilation = ProcedureVentilationSerializer(read_only=True)
// procedure_protocol = ProcedureProtocolSerializer(read_only=True)
// procedure_circulation = ProcedureCirculationSerializer(read_only=True)
// procedure_scale = ProcedureScaleSerializer(read_only=True)
// symptom = SymptomSerializer(read_only=True)