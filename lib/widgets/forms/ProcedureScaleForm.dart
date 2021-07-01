import 'package:flutter/material.dart';
import 'package:project/models/procedures/ProcedureScale.dart';
import 'package:project/views/forms/ProcedureScaleFormState.dart';

class ProcedureScaleForm extends StatefulWidget {
  final formKey;
  final ProcedureScale procedureScale;
  final bool enabled;

  ProcedureScaleForm({Key key, this.formKey, this.procedureScale, this.enabled})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ProcedureScaleFormState(
      formKey: this.formKey,
      procedureScale: procedureScale,
      enabled: enabled
  );
}
