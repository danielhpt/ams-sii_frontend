import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:project/models/procedures/ProcedureRCP.dart';
import 'package:project/widgets/forms/ProcedureRCPForm.dart';

class ProcedureRCPFormState extends State<ProcedureRCPForm> {
  final formKey;
  final ProcedureRCP procedureRCP;
  final bool enabled;
  bool witn;
  bool perf;

  ProcedureRCPFormState({this.procedureRCP, this.formKey, this.enabled});

  @override
  void initState() {
    super.initState();
    witn = procedureRCP.witnessed == null ? false : procedureRCP.witnessed;
    perf = procedureRCP.performed == null ? false : procedureRCP.performed;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(children: [
        Card(
          child: ExpandablePanel(
            header: ListTile(
              title: Text('RCP'),
            ),
            expanded: Column(children: [
              FormField(
                  enabled: enabled,
                  builder: (FormFieldState<bool> state) {
                    return SwitchListTile(
                      title: Text('Presenciada'),
                      value: witn,
                      onChanged: (bool value) {
                        setState(() {
                          witn = value;
                        });
                      },
                    );
                  },
                  onSaved: (value) {
                    procedureRCP.witnessed = witn;
                  }),
              FormField(
                //todo sbv_dae
                enabled: enabled,
                builder: (FormFieldState<dynamic> state) {
                  return InputDatePickerFormField(
                    fieldLabelText: 'Data de Reanimação',
                    lastDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    initialDate: procedureRCP.sbv_dae,
                    onDateSaved: (DateTime value) {
                      procedureRCP.sbv_dae = value;
                    },
                  );
                },
              ),
              TextFormField(
                enabled: enabled,
                initialValue: procedureRCP.firstRhythm,
                decoration: const InputDecoration(
                  icon: Icon(Icons.attribution_outlined),
                  labelText: '1º Ritmo',
                ),
                keyboardType: TextInputType.text,
                onSaved: (String value) {
                  procedureRCP.firstRhythm = value.trim();
                },
              ),
              TextFormField(
                enabled: enabled,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Nº Choque(s)',
                ),
                onSaved: (String value) {
                  procedureRCP.nrShocks = value.isEmpty ? 0 : int.parse(value);
                },
                keyboardType: TextInputType.number,
                autocorrect: false,
              ),
              FormField(
                //todo recovery
                enabled: enabled,
                builder: (FormFieldState<dynamic> state) {
                  return InputDatePickerFormField(
                    lastDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    initialDate: procedureRCP.recovery,
                    onDateSaved: (DateTime value) {
                      procedureRCP.recovery = value;
                    },
                  );
                },
              ),
              FormField(
                //todo downtime
                enabled: enabled,
                builder: (FormFieldState<dynamic> state) {
                  return InputDatePickerFormField(
                    lastDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    initialDate: procedureRCP.downtime,
                    onDateSaved: (DateTime value) {
                      procedureRCP.downtime = value;
                    },
                  );
                },
              ),
              TextFormField(
                enabled: enabled,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Compressões Mecânicas',
                ),
                onSaved: (String value) {
                  procedureRCP.mechanicalCompressions = value.isEmpty ? 0 : int.parse(value);
                },
                keyboardType: TextInputType.number,
                autocorrect: false,
              ),
              FormField(
                  enabled: enabled,
                  builder: (FormFieldState<bool> state) {
                    return SwitchListTile(
                      title: Text('Não Realizado'),
                      value: perf,
                      onChanged: (bool value) {
                        setState(() {
                          perf = value;
                        });
                      },
                    );
                  },
                  onSaved: (value) {
                    procedureRCP.performed = perf;
                  }),
            ]),
          ),
        ),
      ]),
    );
  }
}
