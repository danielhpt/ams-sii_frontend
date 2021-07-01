import 'package:project/widgets/forms/EvaluationForm.dart';
import '../../models/Evaluation.dart';
import 'package:flutter/material.dart';


class EvaluationFormState extends State<EvaluationForm> {
  final formKey;
  final Evaluation evaluation;
  final bool enabled;

  EvaluationFormState({this.formKey, this.evaluation, this.enabled});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(children: [
        FormField(
        //todo hours
        enabled: enabled,
        builder: (FormFieldState<dynamic> state) {
          return InputDatePickerFormField(
            lastDate: DateTime.now(),
            firstDate: DateTime(1900),
            initialDate: evaluation.hours,
            onDateSaved: (DateTime value) {
              evaluation.hours = value;
            },
          );
        },
      ),
        TextFormField(
          enabled: enabled,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'AVDS',
          ),
          onSaved: (String value) {
            evaluation.avds = int.parse(value);
          },
          keyboardType: TextInputType.number,
          autocorrect: false,
        ),
        TextFormField(
          enabled: enabled,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'Ventilation',
          ),
          onSaved: (String value) {
            evaluation.ventilation = int.parse(value);
          },
          keyboardType: TextInputType.number,
          autocorrect: false,
        ),
        TextFormField(
          enabled: enabled,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'SPO2',
          ),
          onSaved: (String value) {
            evaluation.spo2 = int.parse(value);
          },
          keyboardType: TextInputType.number,
          autocorrect: false,
        ),
        TextFormField(
          enabled: enabled,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'O2',
          ),
          onSaved: (String value) {
            evaluation.o2 = int.parse(value);
          },
          keyboardType: TextInputType.number,
          autocorrect: false,
        ),
        TextFormField(
          enabled: enabled,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'EtCo2',
          ),
          onSaved: (String value) {
            evaluation.etco2 = int.parse(value);
          },
          keyboardType: TextInputType.number,
          autocorrect: false,
        ),
        TextFormField(
          enabled: enabled,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'Pulso',
          ),
          onSaved: (String value) {
            evaluation.pulse = int.parse(value);
          },
          keyboardType: TextInputType.number,
          autocorrect: false,
        ),
        FormField(
            enabled: enabled,
            builder: (FormFieldState<bool> state) {
              return SwitchListTile(
                title: Text('ECG'),
                value: evaluation.ecg,
                onChanged: (bool value) {
                  setState(() {
                    evaluation.ecg = value;
                  });
                },
              );
            },
            onSaved: (value) {
              evaluation.ecg = value;
            }),





      ],
      ),
    );


  }

}
