import '../models/ProcedureProtocol.dart';
import 'package:flutter/material.dart';
import 'package:project/views/ProcedureProtocolFormState.dart';

class ProcedureProtocolForm extends StatefulWidget {
  final formKey;
  final ProcedureProtocol procedureProtocol;

  ProcedureProtocolForm({Key key, this.formKey, this.procedureProtocol})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ProcedureProtocolFormState(
      formKey: this.formKey, procedureProtocol: procedureProtocol);
}
