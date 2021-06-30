import 'package:flutter/material.dart';
import 'package:project/widgets/ProcedureRCPForm.dart';
import '../models/ProcedureRCP.dart';

class ProcedureRCPFormState extends State<ProcedureRCPForm> {
  final formKey;
  final ProcedureRCP procedureRCP;
  final bool enabled;

  ProcedureRCPFormState({this.procedureRCP, this.formKey, this.enabled});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  }
}
