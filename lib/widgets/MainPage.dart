import 'package:flutter/material.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/LoginPage.dart';

import 'HomePage.dart';

class MainPage extends StatelessWidget {
  final String title;

  MainPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    token = 'Token beb6862f31eb0a4088b1b90ccfb3ca35c9ba2b1b'; //todo
    if (token != null) {
      return HomePage(title: 'SIREPH Técnicos Home Page');
    }
    return LoginPage();
  }
}
