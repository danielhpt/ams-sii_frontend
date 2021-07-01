import 'package:flutter/material.dart';
import 'package:project/models/procedures/ProcedureProtocol.dart';
import 'package:project/widgets/forms/ProcedureProtocolForm.dart';

class ProcedureProtocolFormState extends State<ProcedureProtocolForm> {
  final formKey;
  final ProcedureProtocol procedureProtocol;
  final bool enabled;

  ProcedureProtocolFormState(
      {this.procedureProtocol, this.formKey, this.enabled});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(children: [
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('Imobilização'),
                  value: procedureProtocol.immobilization,
                  onChanged: (bool value) {
                    setState(() {
                      procedureProtocol.immobilization = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureProtocol.immobilization = value;
              }),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('TEPH'),
                  value: procedureProtocol.teph,
                  onChanged: (bool value) {
                    setState(() {
                      procedureProtocol.teph = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureProtocol.teph = value;
              }),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('SIV'),
                  value: procedureProtocol.siv,
                  onChanged: (bool value) {
                    setState(() {
                      procedureProtocol.siv = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureProtocol.siv = value;
              }),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('VV AVC'),
                  value: procedureProtocol.vv_avc,
                  onChanged: (bool value) {
                    setState(() {
                      procedureProtocol.vv_avc = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureProtocol.vv_avc = value;
              }),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('VV Coronária'),
                  value: procedureProtocol.vv_coronary,
                  onChanged: (bool value) {
                    setState(() {
                      procedureProtocol.vv_coronary = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureProtocol.vv_coronary = value;
              }),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('VV Sépsis'),
                  value: procedureProtocol.vv_sepsis,
                  onChanged: (bool value) {
                    setState(() {
                      procedureProtocol.vv_sepsis = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureProtocol.vv_sepsis = value;
              }),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('VV Trauma'),
                  value: procedureProtocol.vv_trauma,
                  onChanged: (bool value) {
                    setState(() {
                      procedureProtocol.vv_trauma = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureProtocol.vv_trauma = value;
              }),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('VV PCR'),
                  value: procedureProtocol.vv_pcr,
                  onChanged: (bool value) {
                    setState(() {
                      procedureProtocol.vv_pcr = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureProtocol.vv_pcr = value;
              }),
        ]));
  }
}
