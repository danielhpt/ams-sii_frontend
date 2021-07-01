import 'package:flutter/material.dart';
import 'package:project/models/Evaluation.dart';
import 'package:project/views/lists/EvaluationsListPageState.dart';

class EvaluationsListPage extends StatefulWidget {
  final String title;
  final List<Evaluation> evaluations;
  final bool enabled;

  EvaluationsListPage({Key key, this.title, this.evaluations, this.enabled})
      : super(key: key);

  @override
  EvaluationsListPageState createState() => EvaluationsListPageState(
      title: title, evaluations: evaluations, enabled: enabled);
}
