import 'package:flutter/material.dart';
import 'package:project/models/Occurrence.dart';
import 'package:project/widgets/forms/OccurrenceForm.dart';
import 'package:project/widgets/TeamPage.dart';

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
                enabled: false,
                initialValue: occurrence.occurrenceNumber.toString(),
                decoration: const InputDecoration(
                  icon: Icon(Icons.format_list_numbered),
                  labelText: 'Número da Ocorrência',
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                enabled: enabled,
                initialValue: occurrence.entity,
                decoration: const InputDecoration(
                  icon: Icon(Icons.house),
                  labelText: 'Entidade',
                ),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                enabled: enabled,
                initialValue: occurrence.meanOfAssistance,
                decoration: const InputDecoration(
                  icon: Icon(Icons.directions_car),
                  labelText: 'Meio de Socorro',
                ),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                enabled: enabled,
                initialValue: occurrence.motive,
                decoration: const InputDecoration(
                  icon: Icon(Icons.vertical_align_center),
                  labelText: 'Motivo',
                ),
                keyboardType: TextInputType.text,
              ),
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
              ),
              TextFormField(
                enabled: enabled,
                initialValue: occurrence.local,
                decoration: const InputDecoration(
                  icon: Icon(Icons.place),
                  labelText: 'Local',
                ),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                enabled: enabled,
                initialValue: occurrence.parish,
                decoration: const InputDecoration(
                  icon: Icon(Icons.subdirectory_arrow_right),
                  labelText: 'Freguesia',
                ),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                enabled: enabled,
                initialValue: occurrence.municipality,
                decoration: const InputDecoration(
                  icon: Icon(Icons.subdirectory_arrow_right),
                  labelText: 'Concelho',
                ),
                keyboardType: TextInputType.text,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0),
          child: ElevatedButton.icon(
            label: Text(
              'Estados da Ocorrência',
              style: TextStyle(fontSize: 20.0),
            ),
            icon: Icon(
              Icons.gps_fixed,
              size: 50.0,
            ),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        TeamPage(title: 'SIREPH Técnicos Home Page'))),
            style: ButtonStyle(),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0),
          child: ElevatedButton.icon(
            label: Text(
              'Gerir Vítimas',
              style: TextStyle(fontSize: 20.0),
            ),
            icon: Icon(
              Icons.group,
              size: 50.0,
            ),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        TeamPage(title: 'SIREPH Técnicos Home Page'))),
            style: ButtonStyle(),
          ),
        ),
      ]),
    );
  }
}
