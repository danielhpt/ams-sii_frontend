import 'package:flutter/material.dart';
import 'package:project/widgets/ProcedureVentilationForm.dart';
import '../models/ProcedureVentilation.dart';

class ProcedureVentilationFormState extends State<ProcedureVentilationForm> {
  final formKey;
  final ProcedureVentilation procedureVentilation;
  final bool enabled;

  ProcedureVentilationFormState(
      {this.procedureVentilation, this.formKey, this.enabled});

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
                  title: Text('Desobstrução'),
                  value: procedureVentilation.clearance,
                  onChanged: (bool value) {
                    setState(() {
                      procedureVentilation.clearance = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureVentilation.clearance = value;
              }
          ),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('Tubo orofaríngeo'),
                  value: procedureVentilation.oropharyngeal,
                  onChanged: (bool value) {
                    setState(() {
                      procedureVentilation.oropharyngeal = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureVentilation.oropharyngeal = value;
              }
          ),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('Tubo laríngeo'),
                  value: procedureVentilation.laryngealTube,
                  onChanged: (bool value) {
                    setState(() {
                      procedureVentilation.laryngealTube = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureVentilation.laryngealTube = value;
              }
          ),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('Tubo endotraqueal'),
                  value: procedureVentilation.endotracheal,
                  onChanged: (bool value) {
                    setState(() {
                      procedureVentilation.endotracheal = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureVentilation.endotracheal = value;
              }
          ),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('Máscara laríngea'),
                  value: procedureVentilation.laryngealMask,
                  onChanged: (bool value) {
                    setState(() {
                      procedureVentilation.laryngealMask = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureVentilation.laryngealMask = value;
              }
          ),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('Ventilação mecânica'),
                  value: procedureVentilation.mechanicalVentilation,
                  onChanged: (bool value) {
                    setState(() {
                      procedureVentilation.mechanicalVentilation = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureVentilation.mechanicalVentilation = value;
              }
          ),
          FormField(
              enabled: enabled,
              builder: (FormFieldState<bool> state) {
                return SwitchListTile(
                  title: Text('CPAP'),
                  value: procedureVentilation.cpap,
                  onChanged: (bool value) {
                    setState(() {
                      procedureVentilation.cpap = value;
                    });
                  },
                );
              },
              onSaved: (value) {
                procedureVentilation.cpap = value;
              }
          ),

        ]
        )
    );
  }

}
