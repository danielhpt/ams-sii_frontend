import 'package:flutter/material.dart';
import 'package:project/models/Login.dart';
import 'package:project/utils/Offline.dart';
import 'package:project/utils/Utils.dart';
import 'package:project/widgets/HomePage.dart';
import 'package:project/utils/Rest.dart';
import 'package:progress_indicator_button/progress_button.dart';
import 'package:project/widgets/LoginPage.dart';
import 'package:project/widgets/forms/LoginForm.dart';

class LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final Login login = Login();

  LoginPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIREPH Técnicos'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Image.asset(
              'assets/star-of-life.png',
              height: 120,
              width: 120,
            ),
            LoginForm(
              formKey: formKey,
              login: login,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
              child: ProgressButton(
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 20),
                ),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                strokeWidth: 2,
                onPressed: (AnimationController controller) async {
                  controller.forward();
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    try {
                      token = await postToken(login);
                      await saveToken(token);
                      controller.reset();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomePage()),
                          (route) => false);
                    } catch (e) {
                      controller.reset();
                      showToast("Erro ao fazer login");
                    }
                  } else {
                    controller.reset();
                    showToast("Valor(es) Invalido(s)");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
