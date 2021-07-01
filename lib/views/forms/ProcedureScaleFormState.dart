import 'package:flutter/material.dart';
import 'package:project/models/procedures/ProcedureScale.dart';
import 'package:project/widgets/forms/ProcedureScaleForm.dart';

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
    return Form(
      key: formKey,
      child: Column(children: [
        TextFormField(
          enabled: enabled,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'Cincinatti',
          ),
          onSaved: (String value) {
            procedureScale.cincinatti = int.parse(value);
          },
          keyboardType: TextInputType.number,
          autocorrect: false,
        ),
        TextFormField(
          enabled: enabled,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'PROACS',
          ),
          onSaved: (String value) {
            procedureScale.proacs = int.parse(value);
          },
          keyboardType: TextInputType.number,
          autocorrect: false,
          ),
        TextFormField(
          enabled: enabled,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'RTS',
          ),
          onSaved: (String value) {
            procedureScale.rts = int.parse(value);
          },
          keyboardType: TextInputType.number,
          autocorrect: false,
        ),
        TextFormField(
          enabled: enabled,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'MGAP',
          ),
          onSaved: (String value) {
            procedureScale.mgap = int.parse(value);
          },
          keyboardType: TextInputType.number,
          autocorrect: false,
        ),
        TextFormField(
          enabled: enabled,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'RACE',
          ),
          onSaved: (String value) {
            procedureScale.race = int.parse(value);
          },
          keyboardType: TextInputType.number,
          autocorrect: false,
        ),

      ]),
    );
  }
}
