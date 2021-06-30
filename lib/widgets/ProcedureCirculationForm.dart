import 'package:flutter/material.dart';
import 'package:project/views/ProcedureCirculationFormState.dart';
import '../models/ProcedureCirculation.dart';


class ProcedureCirculationForm extends StatefulWidget {
  final formKey;
  final ProcedureCirculation procedureCirculation;

  ProcedureCirculationForm({Key key, this.formKey, this.procedureCirculation}) : super(key:key);

  @override
  State<StatefulWidget> createState() => ProcedureCirculationFormState(
      formKey: this.formKey,
      procedureCirculation: procedureCirculation
  );

}