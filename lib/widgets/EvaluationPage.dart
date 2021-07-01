import 'package:flutter/material.dart';
import 'package:project/models/Evaluation.dart';
import 'package:project/views/EvaluationPageState.dart';

class EvaluationPage extends StatefulWidget {
  final Evaluation evaluation;
  final bool enabled;
  final bool add;
  final int victimId;

  EvaluationPage({Key key, this.evaluation, this.enabled, this.add, this.victimId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EvaluationPageState(add: add, enabled: enabled, evaluation: evaluation, victimId: victimId);
}