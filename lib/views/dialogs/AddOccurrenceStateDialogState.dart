import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:project/models/OccurrenceState.dart';
import 'package:project/models/States.dart';
import 'package:project/utils/GPS.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/dialogs/AddOccurrenceStateDialog.dart';

class AddOccurrenceStateDialogState extends State<AddOccurrenceStateDialog> {
  final formKey = GlobalKey<FormState>();
  int occurrenceId;
  var _currentSelectedValue;
  final OccurrenceState occurrenceState;

  AddOccurrenceStateDialogState({this.occurrenceId, this.occurrenceState});

  var _states = [
    "Caminho do local",
    "Chegada à vitima",
    "Caminho U. Saúde",
    "Chegada U. Saúde",
    "Disponível"
  ];

  Map<String, dynamic> statesJson = <String, dynamic>{
    "Caminho do local": 1,
    "Chegada à vitima": 2,
    "Caminho U. Saúde": 3,
    "Chegada U. Saúde": 5,
    "Disponível": 4,
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Adicionar Técnico"),
      content: Container(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                            //labelStyle: textStyle,
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 16.0),
                            hintText: 'Selecione um estado',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        isEmpty: _currentSelectedValue == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _currentSelectedValue,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _currentSelectedValue = newValue;
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
                ],
              ),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text("Cancelar"),
          onPressed: () => Navigator.pop(context, 'close'),
        ),
        TextButton(
          child: Text("Adicionar"),
          onPressed: () async {
            if (formKey.currentState.validate()) {
              formKey.currentState.save();
              occurrenceState.dateTime = DateTime.now();
              occurrenceState.id = 0;
              try {
                var id = statesJson[_currentSelectedValue];
                occurrenceState.state = States(id: id, state: _currentSelectedValue);
                LocationData l = await getLocation();
                occurrenceState.latitude = l.longitude;
                occurrenceState.longitude = l.latitude;
                var r = await postOccurrenceState(occurrenceId, occurrenceState.toJson());
                Navigator.pop(context, 'add');
              } catch (e) {}
            }
          },
        )
      ],
    );
  }
}
