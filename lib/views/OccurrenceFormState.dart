import 'package:flutter/material.dart';
import 'package:project/models/Occurrence.dart';
import 'package:project/widgets/OccurrenceForm.dart';

class OccurrenceFormState extends State<OccurrenceForm> {
  final formKey;
  final Occurrence occurrence;
  final bool enabled;

  OccurrenceFormState({this.formKey, this.occurrence, this.enabled});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              // ID
              enabled: false,
              decoration: const InputDecoration(
                icon: Icon(Icons.assignment_outlined),
                labelText: 'ID da Ocorrência',
              ),
              onSaved: (String value) {
                occurrence.id = int.parse(value);
              },
              keyboardType: TextInputType.number,
              initialValue:
                  (occurrence.id != -1) ? occurrence.id.toString() : null,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String value) {
                return (value == null || int.tryParse(value) == null)
                    ? 'Not a Integer'
                    : null;
              },
            ),
          ],
        ));
  }
}
