import 'package:flutter/material.dart';
import 'package:project/models/procedures/ProcedureProtocol.dart';
import 'package:project/views/forms/ProcedureProtocolFormState.dart';

class ProcedureProtocolForm extends StatefulWidget {
  final formKey;
  final ProcedureProtocol procedureProtocol;
  final bool enabled;

  ProcedureProtocolForm({Key key, this.formKey, this.procedureProtocol, this.enabled})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ProcedureProtocolFormState(
      formKey: this.formKey,
      procedureProtocol: procedureProtocol,
      enabled:enabled

  );
}
