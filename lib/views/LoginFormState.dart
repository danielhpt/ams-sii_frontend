import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/models/Login.dart';
import 'package:project/widgets/LoginForm.dart';

class LoginFormState extends State<LoginForm> {
  final formKey;
  final Login login;

  LoginFormState({this.login, this.formKey});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Nome de Utilizador',
              ),
              keyboardType: TextInputType.text,
              autocorrect: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String value) {
                return (value == null || value.trim() == "" || value.isEmpty)
                    ? "Não pode estar vazio"
                    : null;
              },
              onSaved: (String value) {
                login.username = value.trim();
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.vpn_key),
                labelText: 'Palavra-Passe',
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String value) {
                return (value == null || value.trim() == "" || value.isEmpty)
                    ? "Não pode estar vazio"
                    : null;
              },
              onSaved: (String value) {
                login.password = value.trim();
              },
            ),
          ],
        ));
  }
}
