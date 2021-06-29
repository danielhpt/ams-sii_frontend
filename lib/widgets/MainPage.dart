import 'package:flutter/material.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/LoginPage.dart';

import 'Home.dart';

class MainPage extends StatelessWidget {
  final String title;

  MainPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    token = 'a'; //todo
    if (token != null) {
      return Home(title: 'SIREPH Técnicos Home Page');
    }
    return LoginPage();
  }
}
