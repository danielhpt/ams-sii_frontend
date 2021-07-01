import 'package:flutter/material.dart';
import 'package:project/models/procedures/ProcedureCirculation.dart';
import 'package:project/widgets/forms/ProcedureCirculationForm.dart';

class ProcedureCirculationFormState extends State<ProcedureCirculationForm> {
  final formKey;
  final ProcedureCirculation procedureCirculation;
  final bool enabled;

  ProcedureCirculationFormState(
      {this.procedureCirculation, this.formKey, this.enabled});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('Controlo Temperatura'),
                  value: procedureCirculation.temperatureMonitoring,
                  onChanged: (bool value) {
                    setState(() {
                      procedureCirculation.temperatureMonitoring = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureCirculation.temperatureMonitoring = value;
              }),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('Compressão'),
                  value: procedureCirculation.compression,
                  onChanged: (bool value) {
                    setState(() {
                      procedureCirculation.compression = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureCirculation.compression = value;
              }),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('Torniquete'),
                  value: procedureCirculation.tourniquet,
                  onChanged: (bool value) {
                    setState(() {
                      procedureCirculation.tourniquet = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureCirculation.tourniquet = value;
              }),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('Cinto pélvico'),
                  value: procedureCirculation.pelvicBelt,
                  onChanged: (bool value) {
                    setState(() {
                      procedureCirculation.pelvicBelt = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureCirculation.pelvicBelt = value;
              }),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('Acesso venoso'),
                  value: procedureCirculation.venousAccess,
                  onChanged: (bool value) {
                    setState(() {
                      procedureCirculation.venousAccess = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureCirculation.venousAccess = value;
              }),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('Penso'),
                  value: procedureCirculation.patch,
                  onChanged: (bool value) {
                    setState(() {
                      procedureCirculation.patch = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureCirculation.patch = value;
              }),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('ECG'),
                  value: procedureCirculation.ecg,
                  onChanged: (bool value) {
                    setState(() {
                      procedureCirculation.ecg = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureCirculation.ecg = value;
              }),
        ],
      ),
    );
  }
}
