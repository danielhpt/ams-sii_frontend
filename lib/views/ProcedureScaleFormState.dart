import 'package:flutter/material.dart';
import 'package:project/widgets/ProcedureScaleForm.dart';
import '../models/ProcedureScale.dart';

class ProcedureScaleFormState extends State<ProcedureScaleForm> {
  final formKey;
  final ProcedureScale procedureScale;
  final bool enabled;

  ProcedureScaleFormState({this.procedureScale, this.formKey, this.enabled});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  }
}
