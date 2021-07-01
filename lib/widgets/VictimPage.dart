import 'package:flutter/material.dart';
import 'package:project/models/Victim.dart';
import 'package:project/views/VictimPageState.dart';

class VictimPage extends StatefulWidget {
  final Victim victim;
  final String title;
  final bool add;

  VictimPage({Key key, this.victim, this.title, this.add}) : super(key: key);

  @override
  VictimPageState createState() => VictimPageState(victim: this.victim, add: add);
}
