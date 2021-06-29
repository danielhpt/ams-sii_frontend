import 'package:flutter/material.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/HomeTemp.dart';
import 'package:project/widgets/LoginPage.dart';

class MainPage extends StatelessWidget {
  final String title;

  MainPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //token = 'a';
    if (token != null) {
      return HomeTemp();
    }
    return LoginPage();
  }
}
