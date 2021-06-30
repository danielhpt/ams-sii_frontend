import 'package:flutter/material.dart';
import '../models/ProcedureRCP.dart';
import 'package:project/views/ProcedureRCPFormState.dart';

class ProcedureRCPForm extends StatefulWidget {
  final formKey;
  final ProcedureRCP procedureRCP;

  ProcedureRCPForm({Key key, this.formKey, this.procedureRCP})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      ProcedureRCPFormState(formKey: this.formKey, procedureRCP: procedureRCP);
}
