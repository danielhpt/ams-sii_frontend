import 'package:flutter/material.dart';
import 'package:project/models/procedures/ProcedureCirculation.dart';
import 'package:project/views/forms/ProcedureCirculationFormState.dart';

class ProcedureCirculationForm extends StatefulWidget {
  final formKey;
  final ProcedureCirculation procedureCirculation;
  final bool enabled;

  ProcedureCirculationForm(
      {Key key, this.formKey, this.procedureCirculation, this.enabled})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ProcedureCirculationFormState(
      formKey: this.formKey,
      procedureCirculation: procedureCirculation,
      enabled: enabled);
}
