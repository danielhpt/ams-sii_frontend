import 'package:flutter/material.dart';
import 'package:project/models/Victim.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/VictimPage.dart';
import 'package:project/widgets/forms/VictimForm.dart';

class VictimPageState extends State<VictimPage> {
  final formKey = GlobalKey<FormState>();
  final Victim victim;

  VictimPageState({this.victim});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      drawer: CustomDrawer(),
      body: SingleChildScrollView (
        child: Column(
          children: [
            VictimForm(
              victim: this.victim,
              formKey: this.formKey,
              enabled: true,
            )
        ],
      ),
    ));
  }
}
