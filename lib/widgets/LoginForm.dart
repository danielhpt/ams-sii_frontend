import 'package:flutter/material.dart';
import 'package:project/models/Login.dart';
import 'package:project/views/LoginFormState.dart';

class LoginForm extends StatefulWidget {
  final formKey;
  final Login login;

  LoginForm({Key key, this.formKey, this.login}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginFormState(
      formKey: this.formKey,
      login: login
  );
}