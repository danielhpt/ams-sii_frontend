import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/models/Evaluation.dart';
import 'package:project/models/Login.dart';
import 'package:project/models/Occurrence.dart';
import 'package:project/models/Pharmacy.dart';
import 'package:project/models/ProcedureCirculation.dart';
import 'package:project/models/ProcedureProtocol.dart';
import 'package:project/models/ProcedureRCP.dart';
import 'package:project/models/ProcedureScale.dart';
import 'package:project/models/ProcedureVentilation.dart';
import 'package:project/models/State.dart';
import 'package:project/models/Symptom.dart';
import 'package:project/models/Team.dart';
import 'package:project/models/User.dart';
import 'package:project/models/Victim.dart';

String url = '192.168.0.14:8000';
String token;
User user;

// token/
Future<String> postToken(Login login) async {
/*  await Future.delayed(Duration(seconds: 3), () {});
  token = 'a';
  return 'a';*/
  var response = await http.post(Uri.http(url, '/api/token/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(login.toJson()));

  if (response.statusCode == 200) {
    token = 'Token ' + jsonDecode(response.body)["token"];
    return token;
  } else {
    throw Exception('Failed to get Token.');
  }
}

// user/
Future<User> getUserByToken() async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.get(Uri.http(url, '/api/user/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      });

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to get User.');
  }
}

// users/<int:user_id>/
Future<User> getUser(int userId) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.get(
      Uri.http(url, '/api/users/' + userId.toString() + '/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      });

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to get User.');
  }
}

// users/<int:user_id>/teams/
Future<List<Team>> getUserTeamsList(int userId) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.get(
      Uri.http(url, '/api/users/' + userId.toString() + '/teams/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      });

  if (response.statusCode == 200) {
    List<dynamic> array = jsonDecode(response.body);

    List<Team> teams = array.map((element) {
      return Team.fromJson(element);
    }).toList();

    return teams;
  } else {
    throw Exception('Failed to get Teams.');
  }
}

Future<Team> postUserTeam(int userId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  var response = await http.post(
      Uri.http(url, '/api/users/' + userId.toString() + '/teams/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 201) {
    return Team.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post Team.');
  }
}

// users/<int:user_id>/occurrences/
Future<List<Occurrence>> getUserOccurrencesList(int userId) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.get(
      Uri.http(url, '/api/users/' + userId.toString() + '/occurrences/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      });

  if (response.statusCode == 200) {
    List<dynamic> array = jsonDecode(response.body);

    List<Occurrence> occurrences = array.map((element) {
      return Occurrence.fromJson(element);
    }).toList();

    return occurrences;
  } else {
    throw Exception('Failed to get Occurrences.');
  }
}

// teams/<int:team_id>/
Future<Team> getTeam(int teamId) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.get(
      Uri.http(url, '/api/teams/' + teamId.toString() + '/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      });

  if (response.statusCode == 200) {
    return Team.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to get Team.');
  }
}

Future<Team> putTeam(int teamId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.put(
      Uri.http(url, '/api/teams/' + teamId.toString() + '/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 200) {
    return Team.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to put Team.');
  }
}

// team/active/<int:user_id>/
Future<Team> getUserTeamActive(int userId) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.get(
      Uri.http(url, '/api/team/active/' + userId.toString() + '/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      });

  if (response.statusCode == 200) {
    return Team.fromJson(jsonDecode(response.body));
  } else {
    return Team();
  }
}

// teams/<int:team_id>/occurrences/
Future<List<Occurrence>> getTeamOccurrencesList(int teamId) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.get(
      Uri.http(url, '/api/teams/' + teamId.toString() + '/occurrences/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      });

  if (response.statusCode == 200) {
    List<dynamic> array = jsonDecode(response.body);

    List<Occurrence> occurrences = array.map((element) {
      return Occurrence.fromJson(element);
    }).toList();

    return occurrences;
  } else {
    throw Exception('Failed to get Occurrences.');
  }
}

Future<Occurrence> postTeamOccurrence(
    int teamId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.post(
      Uri.http(url, '/api/teams/' + teamId.toString() + '/occurrences/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 201) {
    return Occurrence.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post Occurrence.');
  }
}

// occurrences/<int:occurrence_id>/
Future<Occurrence> getOccurrence(int occurrenceId) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.get(
      Uri.http(url, '/api/occurrences/' + occurrenceId.toString() + '/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      });

  if (response.statusCode == 200) {
    return Occurrence.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to get Occurrence.');
  }
}

Future<Occurrence> putOccurrence(
    int occurrenceId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.put(
      Uri.http(url, '/api/occurrences/' + occurrenceId.toString() + '/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 200) {
    return Occurrence.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to put Occurrence.');
  }
}

// occurrences/<int:occurrence_id>/victims/
Future<List<Victim>> getOccurrenceVictimsList(int occurrenceId) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.get(
      Uri.http(
          url, '/api/occurrences/' + occurrenceId.toString() + '/victims/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      });

  if (response.statusCode == 200) {
    List<dynamic> array = jsonDecode(response.body);

    List<Victim> victims = array.map((element) {
      return Victim.fromJson(element);
    }).toList();

    return victims;
  } else {
    throw Exception('Failed to get Victims.');
  }
}

Future<Victim> postOccurrenceVictim(
    int occurrenceId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.post(
      Uri.http(
          url, '/api/occurrences/' + occurrenceId.toString() + '/victims/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 201) {
    return Victim.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post Victim.');
  }
}

// occurrences/<int:occurrence_id>/states/
Future<List<State>> getOccurrenceStatesList(int occurrenceId) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.get(
      Uri.http(url, '/api/occurrences/' + occurrenceId.toString() + '/states/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      });

  if (response.statusCode == 200) {
    List<dynamic> array = jsonDecode(response.body);

    List<State> states = array.map((element) {
      return State.fromJson(element);
    }).toList();

    return states;
  } else {
    throw Exception('Failed to get State.');
  }
}

Future<State> postOccurrenceState(
    int occurrenceId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.post(
      Uri.http(
          url, '/api/occurrences/' + occurrenceId.toString() + '/victims/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 201) {
    return State.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post State.');
  }
}

// victims/<int:victim_id>/
Future<Victim> getVictim(int victimId) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.get(
      Uri.http(url, '/api/victims/' + victimId.toString() + '/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      });

  if (response.statusCode == 200) {
    return Victim.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to get Victim.');
  }
}

Future<Victim> putVictim(int victimId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.put(
      Uri.http(url, '/api/victims/' + victimId.toString() + '/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 200) {
    return Victim.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to put Victim.');
  }
}

// victims/<int:victim_id>/pharmacies/
Future<List<Pharmacy>> getVictimPharmaciesList(int victimId) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.get(
      Uri.http(url, '/api/victims/' + victimId.toString() + '/pharmacies/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      });

  if (response.statusCode == 200) {
    List<dynamic> array = jsonDecode(response.body);

    List<Pharmacy> pharmacies = array.map((element) {
      return Pharmacy.fromJson(element);
    }).toList();

    return pharmacies;
  } else {
    throw Exception('Failed to get Pharmacies.');
  }
}

Future<Pharmacy> postVictimPharmacy(
    int victimId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.post(
      Uri.http(url, '/api/victims/' + victimId.toString() + '/pharmacies/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 201) {
    return Pharmacy.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post Pharmacy.');
  }
}

// victims/<int:victim_id>/pharmacies/<int:pharmacy_id>/
Future<Pharmacy> getVictimPharmacy(int victimId, int pharmacyId) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.get(
      Uri.http(
          url,
          'victims/' +
              victimId.toString() +
              '/pharmacies/' +
              pharmacyId.toString() +
              '/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      });

  if (response.statusCode == 200) {
    return Pharmacy.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to get Pharmacy.');
  }
}

// victims/<int:victim_id>/evaluations/
Future<List<Evaluation>> getVictimEvaluationsList(int victimId) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.get(
      Uri.http(url, '/api/victims/' + victimId.toString() + '/evaluations/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      });

  if (response.statusCode == 200) {
    List<dynamic> array = jsonDecode(response.body);

    List<Evaluation> evaluations = array.map((element) {
      return Evaluation.fromJson(element);
    }).toList();

    return evaluations;
  } else {
    throw Exception('Failed to get Evaluations.');
  }
}

Future<Evaluation> postVictimEvaluation(
    int victimId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.post(
      Uri.http(url, '/api/victims/' + victimId.toString() + '/evaluations/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 201) {
    return Evaluation.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post Evaluation.');
  }
}

// victims/<int:victim_id>/evaluations/<int:evaluation_id>/
Future<Evaluation> getVictimEvaluation(int victimId, int evaluationId) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.get(
      Uri.http(
          url,
          'victims/' +
              victimId.toString() +
              '/evaluations/' +
              evaluationId.toString() +
              '/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      });

  if (response.statusCode == 200) {
    return Evaluation.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to get Pharmacy.');
  }
}

// victims/<int:victim_id>/symptom/
Future<Symptom> postSymptom(int victimId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }

  final response = await http.post(
      Uri.http(url, '/api/victims/' + victimId.toString() + '/symptom/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 201) {
    return Symptom.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post symptom.');
  }
}

Future<Symptom> putSymptom(int victimId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.put(
      Uri.http(url, '/api/victims/' + victimId.toString() + '/symptom/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 200) {
    return Symptom.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to put symptom.');
  }
}

// victims/<int:victim_id>/procedure_rcp/
Future<ProcedureRCP> postProcedureRCP(
    int victimId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }

  final response = await http.post(
      Uri.http(url, '/api/victims/' + victimId.toString() + '/procedure_rcp/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 201) {
    return ProcedureRCP.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post RCP Procedure.');
  }
}

Future<ProcedureRCP> putProcedureRCP(
    int victimId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.put(
      Uri.http(url, '/api/victims/' + victimId.toString() + '/procedure_rcp/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 200) {
    return ProcedureRCP.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to put RCP Procedure.');
  }
}

// victims/<int:victim_id>/procedure_ventilation/
Future<ProcedureVentilation> postProcedureVentilation(
    int victimId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }

  final response = await http.post(
      Uri.http(url,
          '/api/victims/' + victimId.toString() + '/procedure_ventilation/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 201) {
    return ProcedureVentilation.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post Ventilation Procedure.');
  }
}

Future<ProcedureVentilation> putProcedureVentilation(
    int victimId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.put(
      Uri.http(url,
          '/api/victims/' + victimId.toString() + '/procedure_ventilation/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 200) {
    return ProcedureVentilation.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to put Ventilation Procedure.');
  }
}

// victims/<int:victim_id>/procedure_protocol/
Future<ProcedureProtocol> postProcedureProtocol(
    int victimId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }

  final response = await http.post(
      Uri.http(
          url, '/api/victims/' + victimId.toString() + '/procedure_protocol/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 201) {
    return ProcedureProtocol.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post Protocol Procedure.');
  }
}

Future<ProcedureProtocol> putProcedureProtocol(
    int victimId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.put(
      Uri.http(
          url, '/api/victims/' + victimId.toString() + '/procedure_protocol/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 200) {
    return ProcedureProtocol.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to put Protocol Procedure.');
  }
}

// victims/<int:victim_id>/procedure_circulation/
Future<ProcedureCirculation> postProcedureCirculation(
    int victimId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }

  final response = await http.post(
      Uri.http(url,
          '/api/victims/' + victimId.toString() + '/procedure_circulation/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 201) {
    return ProcedureCirculation.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post Circulation Procedure.');
  }
}

Future<ProcedureCirculation> putProcedureCirculation(
    int victimId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.put(
      Uri.http(url,
          '/api/victims/' + victimId.toString() + '/procedure_circulation/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 200) {
    return ProcedureCirculation.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to put Circulation Procedure.');
  }
}

// victims/<int:victim_id>/procedure_scale/
Future<ProcedureScale> postProcedureScale(
    int victimId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }

  final response = await http.post(
      Uri.http(
          url, '/api/victims/' + victimId.toString() + '/procedure_scale/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 201) {
    return ProcedureScale.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post Scale Procedure.');
  }
}

Future<ProcedureScale> putProcedureScale(
    int victimId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.put(
      Uri.http(
          url, '/api/victims/' + victimId.toString() + '/procedure_scale/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token
      },
      body: jsonEncode(json));

  if (response.statusCode == 200) {
    return ProcedureScale.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to put Scale Procedure.');
  }
}
