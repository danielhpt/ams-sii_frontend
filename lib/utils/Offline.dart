import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> saveToken(String token) async {
  var box = await Hive.openBox("token");
  box.put("token", token);
}

Future<String> loadToken() async {
  final documentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  var box = await Hive.openBox("token");
  return box.get("token");
}