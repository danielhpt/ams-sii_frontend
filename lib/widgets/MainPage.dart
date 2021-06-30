import 'package:flutter/material.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/LoginPage.dart';

import 'HomePage.dart';

class MainPage extends StatelessWidget {
  final String title;

  MainPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //token = 'Token bcad18a4d8d00e497358565428865532dec27111'; //todo
    if (token != null) {
      return HomePage(title: 'SIREPH Técnicos Home Page');
    }
    return LoginPage();
  }
}
