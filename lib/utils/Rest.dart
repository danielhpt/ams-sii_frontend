import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/models/Occurrence.dart';
import 'package:project/models/State.dart';
import 'package:project/models/Team.dart';
import 'package:project/models/User.dart';
import 'package:project/models/Victim.dart';

String url = 'localhost:8000/api';
String token;

// token/
Future<void> postToken(String username, String password) async {
  var response = await http.post(Uri.http(url, 'token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, dynamic>{'username': username, 'password': password}));

  if (response.statusCode == 200) {
    token = 'Token ' + jsonDecode(response.body)["token"];
  } else {
    throw Exception('Failed to get Token.');
  }
}

// user/
Future<User> getUserByToken() async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.get(Uri.http(url, 'user'),
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
  final response = await http.get(Uri.http(url, 'users/' + userId.toString()),
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
      Uri.http(url, 'users/' + userId.toString() + '/teams'),
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
      Uri.http(url, 'users/' + userId.toString() + '/teams'),
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
      Uri.http(url, 'users/' + userId.toString() + '/occurrences'),
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
  final response = await http.get(Uri.http(url, 'teams/' + teamId.toString()),
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
  final response = await http.put(Uri.http(url, 'teams/' + teamId.toString()),
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

// teams/<int:team_id>/occurrences/
Future<List<Occurrence>> getTeamOccurrencesList(int teamId) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.get(
      Uri.http(url, 'teams/' + teamId.toString() + '/occurrences'),
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

Future<Occurrence> postTeamOccurrence(int teamId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.post(Uri.http(url, 'teams/' + teamId.toString() + '/occurrences'),
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
  final response = await http.get(Uri.http(url, 'occurrences/' + occurrenceId.toString()),
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

Future<Occurrence> putOccurrence(int occurrenceId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.put(Uri.http(url, 'occurrences/' + occurrenceId.toString()),
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
      Uri.http(url, 'occurrences/' + occurrenceId.toString() + '/victims'),
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

Future<Victim> postOccurrenceVictim(int occurrenceId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.post(Uri.http(url, 'occurrences/' + occurrenceId.toString() + '/victims'),
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
      Uri.http(url, 'occurrences/' + occurrenceId.toString() + '/states'),
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

Future<State> postOccurrenceState(int occurrenceId, Map<String, dynamic> json) async {
  if (token == null) {
    throw Exception('Token null.');
  }
  final response = await http.post(Uri.http(url, 'occurrences/' + occurrenceId.toString() + '/victims'),
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

// todo
// victims/<int:victim_id>/
// get
// put

// victims/<int:victim_id>/pharmacies/
// get
// post

// victims/<int:victim_id>/pharmacies/<int:pharmacy_id>/
// get

// victims/<int:victim_id>/evaluations/
// get
// post

// victims/<int:victim_id>/evaluations/<int:evaluation_id>/
// get

// victims/<int:victim_id>/symptom/
// post
// put

// victims/<int:victim_id>/procedure_rcp/
// post
// put

// victims/<int:victim_id>/procedure_ventilation/
// post
// put

// victims/<int:victim_id>/procedure_protocol/
// post
// put

// victims/<int:victim_id>/procedure_circulation/
// post
// put

// victims/<int:victim_id>/procedure_scale/
// post
// put
