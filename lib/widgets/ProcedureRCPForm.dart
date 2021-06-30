import 'package:flutter/material.dart';
import '../models/ProcedureRCP.dart';
import 'package:project/views/ProcedureRCPFormState.dart';

class ProcedureRCPForm extends StatefulWidget {
  final formKey;
  final ProcedureRCP procedureRCP;
  final bool enabled;

  ProcedureRCPForm({Key key, this.formKey, this.procedureRCP, this.enabled})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ProcedureRCPFormState(
      formKey: this.formKey,
      procedureRCP: procedureRCP,
      enabled: enabled

  );
}
