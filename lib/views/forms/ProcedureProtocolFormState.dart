import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:project/models/procedures/ProcedureProtocol.dart';
import 'package:project/widgets/forms/ProcedureProtocolForm.dart';

class ProcedureProtocolFormState extends State<ProcedureProtocolForm> {
  final formKey;
  final ProcedureProtocol procedureProtocol;
  final bool enabled;
  bool immobilization;
  bool teph;
  bool siv;
  bool vv_avc;
  bool vv_coronary;
  bool vv_sepsis;
  bool vv_trauma;
  bool vv_pcr;

  ProcedureProtocolFormState(
      {this.procedureProtocol, this.formKey, this.enabled});

  @override
  void initState() {
    super.initState();
    immobilization = procedureProtocol.immobilization == null ? false : procedureProtocol.immobilization;
    teph = procedureProtocol.teph == null ? false : procedureProtocol.teph;
    siv = procedureProtocol.siv == null ? false : procedureProtocol.siv;
    vv_avc = procedureProtocol.vv_avc == null ? false : procedureProtocol.vv_avc;
    vv_coronary = procedureProtocol.vv_coronary == null ? false : procedureProtocol.vv_coronary;
    vv_sepsis = procedureProtocol.vv_sepsis == null ? false : procedureProtocol.vv_sepsis;
    vv_trauma = procedureProtocol.vv_trauma == null ? false : procedureProtocol.vv_trauma;
    vv_pcr = procedureProtocol.vv_pcr == null ? false : procedureProtocol.vv_pcr;
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
                    title: Text('Protocolos'),
                  ),
                  expanded: Column(children: [
                    FormField(
                        enabled: enabled,
                        builder: (FormFieldState<bool> state) {
                          return SwitchListTile(
                            title: Text('Imobilização'),
                            value: immobilization,
                            onChanged: (bool value) {
                              setState(() {
                                immobilization = value;
                              });
                            },
                          );
                        },
                        onSaved: (value) {
                          procedureProtocol.immobilization = immobilization;
                        }),
                    FormField(
                        enabled: enabled,
                        builder: (FormFieldState<bool> state) {
                          return SwitchListTile(
                            title: Text('TEPH'),
                            value: teph,
                            onChanged: (bool value) {
                              setState(() {
                                teph = value;
                              });
                            },
                          );
                        },
                        onSaved: (value) {
                          procedureProtocol.teph = teph;
                        }),
                    FormField(
                        enabled: enabled,
                        builder: (FormFieldState<bool> state) {
                          return SwitchListTile(
                            title: Text('SIV'),
                            value: siv,
                            onChanged: (bool value) {
                              setState(() {
                                siv = value;
                              });
                            },
                          );
                        },
                        onSaved: (value) {
                          procedureProtocol.siv = siv;
                        }),
                    FormField(
                        enabled: enabled,
                        builder: (FormFieldState<bool> state) {
                          return SwitchListTile(
                            title: Text('VV AVC'),
                            value: vv_avc,
                            onChanged: (bool value) {
                              setState(() {
                                vv_avc = value;
                              });
                            },
                          );
                        },
                        onSaved: (value) {
                          procedureProtocol.vv_avc = vv_avc;
                        }),
                    FormField(
                        enabled: enabled,
                        builder: (FormFieldState<bool> state) {
                          return SwitchListTile(
                            title: Text('VV Coronária'),
                            value: vv_coronary,
                            onChanged: (bool value) {
                              setState(() {
                                vv_coronary = value;
                              });
                            },
                          );
                        },
                        onSaved: (value) {
                          procedureProtocol.vv_coronary = vv_coronary;
                        }),
                    FormField(
                        enabled: enabled,
                        builder: (FormFieldState<bool> state) {
                          return SwitchListTile(
                            title: Text('VV Sépsis'),
                            value: vv_sepsis,
                            onChanged: (bool value) {
                              setState(() {
                                vv_sepsis = value;
                              });
                            },
                          );
                        },
                        onSaved: (value) {
                          procedureProtocol.vv_sepsis = vv_sepsis;
                        }),
                    FormField(
                        enabled: enabled,
                        builder: (FormFieldState<bool> state) {
                          return SwitchListTile(
                            title: Text('VV Trauma'),
                            value: vv_trauma,
                            onChanged: (bool value) {
                              setState(() {
                                vv_trauma = value;
                              });
                            },
                          );
                        },
                        onSaved: (value) {
                          procedureProtocol.vv_trauma = vv_trauma;
                        }),
                    FormField(
                        enabled: enabled,
                        builder: (FormFieldState<bool> state) {
                          return SwitchListTile(
                            title: Text('VV PCR'),
                            value: vv_pcr,
                            onChanged: (bool value) {
                              setState(() {
                                vv_pcr = value;
                              });
                            },
                          );
                        },
                        onSaved: (value) {
                          procedureProtocol.vv_pcr = vv_pcr;
                        }),
                  ]))),
        ],
      ),
    );
  }
}
