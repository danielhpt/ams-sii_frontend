import 'package:flutter/material.dart';
import 'package:project/widgets/ProcedureProtocolForm.dart';
import '../models/ProcedureProtocol.dart';

class ProcedureProtocolFormState extends State<ProcedureProtocolForm> {
  final formKey;
  final ProcedureProtocol procedureProtocol;
  final bool enabled;

  ProcedureProtocolFormState({this.procedureProtocol, this.formKey, this.enabled});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  }
}
