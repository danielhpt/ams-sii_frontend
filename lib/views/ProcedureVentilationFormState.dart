import 'package:flutter/material.dart';
import 'package:project/widgets/ProcedureVentilationForm.dart';
import '../models/ProcedureVentilation.dart';

class ProcedureVentilationFormState extends State<ProcedureVentilationForm> {
  final formKey;
  final ProcedureVentilation procedureVentilation;
  final bool enabled;

  ProcedureVentilationFormState({this.procedureVentilation, this.formKey, this.enabled});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  }
}