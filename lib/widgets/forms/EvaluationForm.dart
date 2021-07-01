import 'package:flutter/material.dart';
import 'package:project/views/forms/EvaluationFormState.dart';
import '../../models/Evaluation.dart';



class EvaluationForm extends StatefulWidget {
  final formKey;
  final Evaluation evaluation;
  final bool enabled;

  EvaluationForm({Key key, this.formKey, this.evaluation, this.enabled}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EvaluationFormState(
      formKey: this.formKey,
      evaluation: this.evaluation,
      enabled: this.enabled

  );
}