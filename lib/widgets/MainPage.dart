import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:project/utils/GPS.dart';
import 'package:project/utils/Offline.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/LoginPage.dart';

import 'HomePage.dart';

class MainPage extends StatelessWidget {
  final String title;

  MainPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //token = 'Token bcad18a4d8d00e497358565428865532dec27111'; //todo
    return FutureBuilder(
      builder: (context, location) {
        if (!location.hasData) {
          return Center(child: CircularProgressIndicator());
        } else if (location == null) {
          return Center(
            child: Text('Localização Obrigatória'),
          );
        } else {
          if (token != null) {
            return HomePage();
          }
          return LoginPage();
        }
      },
      future: init(),
    );
  }
}

Future<LocationData> init() async {
  if (token == null) {
    token = await loadToken();
  }
  return await getLocation();
}
