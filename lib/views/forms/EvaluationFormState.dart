import 'package:project/widgets/forms/EvaluationForm.dart';
import '../../models/Evaluation.dart';
import 'package:flutter/material.dart';

class EvaluationFormState extends State<EvaluationForm> {
  final formKey;
  final Evaluation evaluation;
  final bool enabled;
  bool ecg;

  EvaluationFormState({this.formKey, this.evaluation, this.enabled});

  @override
  void initState() {
    super.initState();
    ecg = evaluation.ecg == null ? false : evaluation.ecg;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          FormField(
            //todo hours
            enabled: enabled,
            builder: (FormFieldState<dynamic> state) {
              return InputDatePickerFormField(
                lastDate: DateTime.now(),
                firstDate: DateTime(1900),
                initialDate: evaluation.hours == null ? DateTime.now() : evaluation.hours,
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
              evaluation.avds = value == '' ? null : int.parse(value);
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
              evaluation.ventilation = value == '' ? null : int.parse(value);
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
              evaluation.spo2 = value == '' ? null : int.parse(value);
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
              evaluation.o2 = value == '' ? null : int.parse(value);
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
              evaluation.etco2 = value == '' ? null : int.parse(value);
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
              evaluation.pulse = value == '' ? null : int.parse(value);
            },
            keyboardType: TextInputType.number,
            autocorrect: false,
          ),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('ECG'),
                  value: ecg,
                  onChanged: (bool value) {
                    setState(() {
                      ecg = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                evaluation.ecg = ecg;
              }),
          TextFormField(
            enabled: enabled,
            initialValue: evaluation.skin,
            decoration: const InputDecoration(
              icon: Icon(Icons.attribution_outlined),
              labelText: 'Pele',
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
            onSaved: (String value) {
              evaluation.skin = value.trim();
            },
          ),
          TextFormField(
            enabled: enabled,
            decoration: const InputDecoration(
              icon: Icon(Icons.wb_sunny),
              labelText: 'Temperatura',
            ),
            onSaved: (String value) {
              evaluation.temperature = value == '' ? null : double.parse(value);
            },
            keyboardType: TextInputType.number,
            autocorrect: false,
          ),
          TextFormField(
            enabled: enabled,
            decoration: const InputDecoration(
              icon: Icon(Icons.sync_alt),
              labelText: 'Pressão arterial sistólica',
            ),
            onSaved: (String value) {
              evaluation.systolicBloodPressure = value == '' ? null : int.parse(value);
            },
            keyboardType: TextInputType.number,
            autocorrect: false,
          ),
          TextFormField(
            enabled: enabled,
            decoration: const InputDecoration(
              icon: Icon(Icons.sync_alt),
              labelText: 'Pressão arterial diastólica',
            ),
            onSaved: (String value) {
              evaluation.diastolicBloodPressure = value == '' ? null : int.parse(value);
            },
            keyboardType: TextInputType.number,
            autocorrect: false,
          ),
          TextFormField(
            enabled: enabled,
            initialValue: evaluation.pupils,
            decoration: const InputDecoration(
              icon: Icon(Icons.remove_red_eye_sharp),
              labelText: 'Pupilas',
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
            onSaved: (String value) {
              evaluation.pupils = value.trim();
            },
          ),
          TextFormField(
            //todo validações 0 a 10
            enabled: enabled,
            decoration: const InputDecoration(
              icon: Icon(Icons.sync_alt),
              labelText: 'Dor',
            ),
            onSaved: (String value) {
              evaluation.pain = value == '' ? null : int.parse(value);
            },
            keyboardType: TextInputType.number,
            autocorrect: false,
          ),
          TextFormField(
            enabled: enabled,
            decoration: const InputDecoration(
              icon: Icon(Icons.breakfast_dining),
              labelText: 'Glicemia',
            ),
            onSaved: (String value) {
              evaluation.glycemia = value == '' ? null : int.parse(value);
            },
            keyboardType: TextInputType.number,
            autocorrect: false,
          ),
          TextFormField(
            //todo validações 0 a 18
            enabled: enabled,
            decoration: const InputDecoration(
              icon: Icon(Icons.sync_alt),
              labelText: 'Dor',
            ),
            onSaved: (String value) {
              evaluation.news = value == '' ? null : int.parse(value);
            },
            keyboardType: TextInputType.number,
            autocorrect: false,
          ),
        ],
      ),
    );
  }
}
