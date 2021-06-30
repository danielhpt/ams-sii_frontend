import 'package:flutter/material.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/LoginPage.dart';

import 'HomePage.dart';

class MainPage extends StatelessWidget {
  final String title;

  MainPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    token = 'Token 69e7172f6f161393b28c35be5c6208e8866155b7'; //todo
    if (token != null) {
      return HomePage(title: 'SIREPH Técnicos Home Page');
    }
    return LoginPage();
  }
}
