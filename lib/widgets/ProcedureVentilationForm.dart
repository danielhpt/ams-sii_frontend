import 'package:flutter/material.dart';
import 'package:project/views/ProcedureVentilationFormState.dart';
import '../models/ProcedureVentilation.dart';

class ProcedureVentilationForm extends StatefulWidget {
  final formKey;
  final ProcedureVentilation procedureVentilation;
  final bool enabled;

  ProcedureVentilationForm({Key key, this.formKey, this.procedureVentilation, this.enabled})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ProcedureVentilationFormState(
      formKey: this.formKey,
      procedureVentilation: procedureVentilation,
      enabled: enabled
  );
}
