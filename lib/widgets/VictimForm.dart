import 'package:flutter/material.dart';
import 'package:project/models/Victim.dart';
import 'package:project/views/VictimFormState.dart';

class VictimForm extends StatefulWidget {
  final formKey;
  final Victim victim;
  final bool enabled;

  VictimForm({Key key, this.formKey, this.victim, this.enabled}) : super(key: key);

  @override
  State<StatefulWidget> createState() => VictimFormState(
      formKey: this.formKey,
      victim: victim,
      enabled: enabled
  );
}