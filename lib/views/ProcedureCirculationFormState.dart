import 'package:flutter/material.dart';
import 'package:project/widgets/ProcedureCirculationForm.dart';
import '../models/ProcedureCirculation.dart';

class ProcedureCirculationFormState extends State<ProcedureCirculationForm> {
  final formKey;
  final ProcedureCirculation procedureCirculation;
  final bool enabled;

  ProcedureCirculationFormState({this.procedureCirculation, this.formKey, this.enabled});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  }
}
