import 'package:flutter/material.dart';
import 'package:project/models/Login.dart';
import 'package:project/utils/Utils.dart';
import 'package:project/widgets/HomeTemp.dart';
import 'package:project/widgets/LoginForm.dart';
import 'package:project/utils/Rest.dart';
import 'package:progress_indicator_button/progress_button.dart';
import 'package:project/widgets/LoginPage.dart';

class LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final Login login = Login();

  LoginPageState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        child: Column(
          children: [
            LoginForm(
              formKey: formKey,
              login: login,
            ),
            ProgressButton(
                child: Text('Log In'),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                strokeWidth: 2,
                onPressed: (AnimationController controller) async {
                  print('HERE 1');
                  controller.forward();
                  if (formKey.currentState.validate()) {
                    print('HERE 2');
                    formKey.currentState.save();
                    print('HERE 3');
                    try {
                      var s = await postToken(login);
                      print('HERE 4');
                      controller.reset();
                      print('HERE 5');
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeTemp()), (route) => false);
                    } catch (e) {
                      print('HERE 6');
                      controller.reset();
                      print('HERE 7');
                      showToast("Erro ao fazer login");
                    }
                  } else {
                    controller.reset();
                    showToast("Valor(es) Invalido(s)");
                  }
                },
            )
          ],
        )
      ),
    );
  }
}