import 'package:flutter/material.dart';
import 'package:project/models/Victim.dart';
import 'package:project/views/forms/VictimFormState.dart';

class VictimForm extends StatefulWidget {
  final formKey;
  final Victim victim;
  final bool enabled;
  final bool add;

  VictimForm({Key key, this.formKey, this.victim, this.enabled, this.add})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => VictimFormState(
        formKey: this.formKey,
        victim: victim,
        enabled: enabled,
        add: add,
      );
}
