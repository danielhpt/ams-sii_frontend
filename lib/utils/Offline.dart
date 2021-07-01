import 'package:hive_flutter/hive_flutter.dart';

Future<void> saveToken(String token) async {
  var box = await Hive.openBox("token");
  box.put("token", token);
}

Future<String> loadToken() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("token");
  return box.get("token");
}

Future<void> deleteToken() async {
  await Hive.deleteBoxFromDisk("token");
}
