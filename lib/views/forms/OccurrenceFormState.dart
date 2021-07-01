import 'package:flutter/material.dart';
import 'package:project/models/Occurrence.dart';
import 'package:project/widgets/forms/OccurrenceForm.dart';

class OccurrenceFormState extends State<OccurrenceForm> {
  final formKey;
  final Occurrence occurrence;
  final bool enabled;

  OccurrenceFormState({this.formKey, this.occurrence, this.enabled});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(children: [
        Card(
          child: Column(
            children: [
              TextFormField(
                  enabled: enabled,
                  initialValue: occurrence.occurrenceNumber == null
                      ? ''
                      : occurrence.occurrenceNumber.toString(),
                  decoration: const InputDecoration(
                    icon: Icon(Icons.format_list_numbered),
                    labelText: 'Número da Ocorrência',
                  ),
                  keyboardType: TextInputType.number,
                  onSaved: (String value) {
                    occurrence.occurrenceNumber = int.parse(value);
                  }),
              TextFormField(
                  enabled: enabled,
                  initialValue: occurrence.entity,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.house),
                    labelText: 'Entidade',
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (String value) {
                    occurrence.entity = value;
                  }),
              TextFormField(
                  enabled: enabled,
                  initialValue: occurrence.meanOfAssistance,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.directions_car),
                    labelText: 'Meio de Socorro',
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (String value) {
                    occurrence.meanOfAssistance = value;
                  }),
              TextFormField(
                  enabled: enabled,
                  initialValue: occurrence.motive,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.vertical_align_center),
                    labelText: 'Motivo',
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (String value) {
                    occurrence.motive = value;
                  }),
              TextFormField(
                  enabled: false,
                  initialValue: occurrence.victims != null
                      ? occurrence.victims.length.toString()
                      : '0',
                  decoration: const InputDecoration(
                    icon: Icon(Icons.people),
                    labelText: 'Número de Vítimas',
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (String value) {
                    occurrence.numberOfVictims = int.parse(value);
                  }),
              TextFormField(
                  enabled: enabled,
                  initialValue: occurrence.local,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.place),
                    labelText: 'Local',
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (String value) {
                    occurrence.local = value;
                  }),
              TextFormField(
                  enabled: enabled,
                  initialValue: occurrence.parish,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.subdirectory_arrow_right),
                    labelText: 'Freguesia',
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (String value) {
                    occurrence.parish = value;
                  }),
              TextFormField(
                  enabled: enabled,
                  initialValue: occurrence.municipality,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.subdirectory_arrow_right),
                    labelText: 'Concelho',
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (String value) {
                    occurrence.municipality = value;
                  }),
            ],
          ),
        ),
      ]),
    );
  }
}
