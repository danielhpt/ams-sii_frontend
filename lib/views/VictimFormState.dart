import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:project/models/Victim.dart';
import 'package:project/widgets/VictimForm.dart';

class VictimFormState extends State<VictimForm> {
  final formKey;
  final Victim victim;
  final bool enabled;

  VictimFormState({this.formKey, this.victim, this.enabled});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          ExpandablePanel(
            header: Text('Identificação'),
            collapsed: ExpandableButton(),
            expanded: Column(
              children: [
                TextFormField(
                  enabled: enabled,
                  initialValue: victim.name,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Nome',
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (String value) {
                    victim.name = value.trim();
                  },
                ),
                FormField(
                  enabled: enabled,
                  builder: (FormFieldState<dynamic> state) {
                    return InputDatePickerFormField(
                      lastDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      initialDate: victim.birthdate,
                      onDateSaved: (DateTime value) {
                        victim.birthdate = value;
                      },
                    );
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.access_time),
                    labelText: 'Idade',
                  ),
                  onSaved: (String value) {
                    victim.age = int.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  initialValue: victim.age.toString(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String value) {
                    return (value != null && int.tryParse(value) == null)
                        ? 'Não é um Numero'
                        : (value != null && int.parse(value) < 0)
                            ? 'Invalido'
                            : null;
                  },
                ),
                TextFormField(
                  enabled: enabled,
                  initialValue: victim.gender,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.attribution_outlined),
                    labelText: 'Genero',
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (String value) {
                    victim.gender = value.trim();
                  },
                ),
                TextFormField(
                  enabled: enabled,
                  initialValue: victim.identityNumber,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.assignment_outlined),
                    labelText: 'Documento',
                  ),
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  onSaved: (String value) {
                    victim.identityNumber = value.trim();
                  },
                ),
                TextFormField(
                  enabled: enabled,
                  initialValue: victim.address,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.home_outlined),
                    labelText: 'Morada',
                  ),
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  onSaved: (String value) {
                    victim.address = value.trim();
                  },
                ),
              ],
            ),
          ),
          ExpandablePanel(collapsed: collapsed, expanded: expanded)
        ],
      ),
    );
  }
}
