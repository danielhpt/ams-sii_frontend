import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:project/models/procedures/ProcedureCirculation.dart';
import 'package:project/widgets/forms/ProcedureCirculationForm.dart';

class ProcedureCirculationFormState extends State<ProcedureCirculationForm> {
  final formKey;
  final ProcedureCirculation procedureCirculation;
  final bool enabled;
  bool temp;
  bool comp;
  bool tour;
  bool pelv;
  bool veno;
  bool patc;
  bool ecg;

  ProcedureCirculationFormState(
      {this.procedureCirculation, this.formKey, this.enabled});

  @override
  void initState() {
    super.initState();
    temp = procedureCirculation.temperatureMonitoring == null
        ? false
        : procedureCirculation.temperatureMonitoring;
    comp = procedureCirculation.compression == null
        ? false
        : procedureCirculation.compression;
    tour = procedureCirculation.tourniquet == null
        ? false
        : procedureCirculation.tourniquet;
    pelv = procedureCirculation.pelvicBelt == null
        ? false
        : procedureCirculation.pelvicBelt;
    veno = procedureCirculation.venousAccess == null
        ? false
        : procedureCirculation.venousAccess;
    patc =
        procedureCirculation.patch == null ? false : procedureCirculation.patch;
    ecg = procedureCirculation.ecg == null ? false : procedureCirculation.ecg;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Card(
              child: ExpandablePanel(
            header: ListTile(
              title: Text('Circulação'),
            ),
            expanded: Column(
              children: [
                FormField(
                    enabled: enabled,
                    builder: (FormFieldState<bool> state) {
                      return SwitchListTile(
                        title: Text('Controlo de Temperatura'),
                        value: temp,
                        onChanged: (bool value) {
                          setState(() {
                            temp = value;
                          });
                        },
                      );
                    },
                    onSaved: (value) {
                      procedureCirculation.temperatureMonitoring = temp;
                    }),
                FormField(
                    enabled: enabled,
                    builder: (FormFieldState<bool> state) {
                      return SwitchListTile(
                        title: Text('Compressão'),
                        value: comp,
                        onChanged: (bool value) {
                          setState(() {
                            comp = value;
                          });
                        },
                      );
                    },
                    onSaved: (value) {
                      procedureCirculation.compression = comp;
                    }),
                FormField(
                    enabled: enabled,
                    builder: (FormFieldState<bool> state) {
                      return SwitchListTile(
                        title: Text('Torniquete'),
                        value: tour,
                        onChanged: (bool value) {
                          setState(() {
                            tour = value;
                          });
                        },
                      );
                    },
                    onSaved: (value) {
                      procedureCirculation.tourniquet = tour;
                    }),
                FormField(
                    enabled: enabled,
                    builder: (FormFieldState<bool> state) {
                      return SwitchListTile(
                        title: Text('Cinto pélvico'),
                        value: pelv,
                        onChanged: (bool value) {
                          setState(() {
                            pelv = value;
                          });
                        },
                      );
                    },
                    onSaved: (value) {
                      procedureCirculation.pelvicBelt = pelv;
                    }),
                FormField(
                    enabled: enabled,
                    builder: (FormFieldState<bool> state) {
                      return SwitchListTile(
                        title: Text('Acesso venoso'),
                        value: veno,
                        onChanged: (bool value) {
                          setState(() {
                            veno = value;
                          });
                        },
                      );
                    },
                    onSaved: (value) {
                      procedureCirculation.venousAccess = veno;
                    }),
                FormField(
                    enabled: enabled,
                    builder: (FormFieldState<bool> state) {
                      return SwitchListTile(
                        title: Text('Penso'),
                        value: patc,
                        onChanged: (bool value) {
                          setState(() {
                            patc = value;
                          });
                        },
                      );
                    },
                    onSaved: (value) {
                      procedureCirculation.patch = patc;
                    }),
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
                      procedureCirculation.ecg = ecg;
                    }),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
