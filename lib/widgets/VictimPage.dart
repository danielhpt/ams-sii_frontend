import 'package:flutter/material.dart';
import 'package:project/models/Victim.dart';
import 'package:project/views/VictimPageState.dart';

class VictimPage extends StatefulWidget {
  final Victim victim;
  final bool add;
  final int occurrenceId;
  final bool enabled;

  VictimPage({Key key, this.victim, this.add, this.occurrenceId, this.enabled})
      : super(key: key);

  @override
  VictimPageState createState() => VictimPageState(
      victim: this.victim, add: add, occurrenceId: occurrenceId, enabled: enabled,);
}
