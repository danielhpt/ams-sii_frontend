import 'package:flutter/material.dart';
import 'package:project/widgets/forms/OccurrenceStatesForm.dart';
import '../../models/OccurrenceState.dart';

class OccurrenceStatesFormState extends State<OccurrenceStatesForm> {
  final formKey;
  final OccurrenceState occurrenceState;
  final bool enabled;

  OccurrenceStatesFormState({this.formKey, this.occurrenceState, this.enabled});

  var _states = [
    "Caminho do local",
    "Chegada à vitíma",
    "Caminho U. Saúde",
    "Chegada U. Saúde",
    "Disponível"
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                    labelStyle: textStyle,
                    errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                    hintText: 'Selecione um estado',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                isEmpty: _currentSelectedValue == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _currentSelectedValue,
                    isDense: true,
                    onChanged: (String newValue) {
                      setState(() {
                        _currentSelectedValue  = newValue;
                        state.didChange(newValue);
                      });
                    },
                    items: _states.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
          FormField(
            //todo Date
            enabled: enabled,
            builder: (FormFieldState<dynamic> state) {
              return InputDatePickerFormField(
                lastDate: DateTime.now(),
                firstDate: DateTime(1900),
                initialDate: occurrenceState.dateTime,
                onDateSaved: (DateTime value) {
                  occurrenceState.dateTime = value;
                },
              );
            },
          ),
        ],
      ),
    );

  }

}
