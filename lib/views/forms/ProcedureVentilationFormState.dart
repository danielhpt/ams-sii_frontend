import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:project/models/procedures/ProcedureVentilation.dart';
import 'package:project/widgets/forms/ProcedureVentilationForm.dart';

class ProcedureVentilationFormState extends State<ProcedureVentilationForm> {
  final formKey;
  final ProcedureVentilation procedureVentilation;
  final bool enabled;
  bool clean;
  bool oroph;
  bool laryn;
  bool endo;
  bool larynMask;
  bool mech;
  bool cpap;

  ProcedureVentilationFormState(
      {this.procedureVentilation, this.formKey, this.enabled});

  @override
  void initState() {
    super.initState();
    clean = procedureVentilation.clearance == null ? false : procedureVentilation.clearance;
    oroph = procedureVentilation.oropharyngeal == null ? false : procedureVentilation.oropharyngeal;
    laryn = procedureVentilation.laryngealTube == null ? false : procedureVentilation.laryngealTube;
    endo = procedureVentilation.endotracheal == null ? false : procedureVentilation.endotracheal;
    larynMask = procedureVentilation.laryngealMask == null ? false : procedureVentilation.laryngealMask;
    mech = procedureVentilation.mechanicalVentilation == null ? false : procedureVentilation.mechanicalVentilation;
    cpap = procedureVentilation.mechanicalVentilation == null ? false : procedureVentilation.cpap;
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
                    title: Text('VA / Ventilação'),
                  ),
                  expanded: Column(children: [
                    FormField(
                        enabled: enabled,
                        builder: (FormFieldState<bool> state) {
                          return SwitchListTile(
                            title: Text('Desobstrução'),
                            value: clean,
                            onChanged: (bool value) {
                              setState(() {
                                clean = value;
                              });
                            },
                          );
                        },
                        onSaved: (value) {
                          procedureVentilation.clearance = clean;
                        }),
                    FormField(
                        enabled: enabled,
                        builder: (FormFieldState<bool> state) {
                          return SwitchListTile(
                            title: Text('Tubo orofaríngeo'),
                            value: endo,
                            onChanged: (bool value) {
                              setState(() {
                                endo = value;
                              });
                            },
                          );
                        },
                        onSaved: (value) {
                          procedureVentilation.oropharyngeal = endo;
                        }),
                    FormField(
                        enabled: enabled,
                        builder: (FormFieldState<bool> state) {
                          return SwitchListTile(
                            title: Text('Tubo laríngeo'),
                            value: laryn,
                            onChanged: (bool value) {
                              setState(() {
                                laryn = value;
                              });
                            },
                          );
                        },
                        onSaved: (value) {
                          procedureVentilation.laryngealTube = laryn;
                        }),
                    FormField(
                        enabled: enabled,
                        builder: (FormFieldState<bool> state) {
                          return SwitchListTile(
                            title: Text('Tubo endotraqueal'),
                            value: endo,
                            onChanged: (bool value) {
                              setState(() {
                                endo = value;
                              });
                            },
                          );
                        },
                        onSaved: (value) {
                          procedureVentilation.endotracheal = endo;
                        }),
                    FormField(
                        enabled: enabled,
                        builder: (FormFieldState<bool> state) {
                          return SwitchListTile(
                            title: Text('Máscara laríngea'),
                            value: larynMask,
                            onChanged: (bool value) {
                              setState(() {
                                larynMask = value;
                              });
                            },
                          );
                        },
                        onSaved: (value) {
                          procedureVentilation.laryngealMask = larynMask;
                        }),
                    FormField(
                        enabled: enabled,
                        builder: (FormFieldState<bool> state) {
                          return SwitchListTile(
                            title: Text('Ventilação mecânica'),
                            value: mech,
                            onChanged: (bool value) {
                              setState(() {
                                mech =
                                    value;
                              });
                            },
                          );
                        },
                        onSaved: (value) {
                          procedureVentilation.mechanicalVentilation = mech;
                        }),
                    FormField(
                        enabled: enabled,
                        builder: (FormFieldState<bool> state) {
                          return SwitchListTile(
                            title: Text('CPAP'),
                            value: cpap,
                            onChanged: (bool value) {
                              setState(() {
                                cpap = value;
                              });
                            },
                          );
                        },
                        onSaved: (value) {
                          procedureVentilation.cpap = cpap;
                        }),
                  ]))),
        ],
      ),
    );
  }
}
