import 'package:flutter/material.dart';
import 'package:project/models/procedures/ProcedureCirculation.dart';
import 'package:project/models/procedures/ProcedureProtocol.dart';
import 'package:project/models/procedures/ProcedureRCP.dart';
import 'package:project/models/procedures/ProcedureScale.dart';
import 'package:project/models/procedures/ProcedureVentilation.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/utils/Utils.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/ProceduresPage.dart';
import 'package:project/widgets/forms/ProcedureCirculationForm.dart';
import 'package:project/widgets/forms/ProcedureProtocolForm.dart';
import 'package:project/widgets/forms/ProcedureRCPForm.dart';
import 'package:project/widgets/forms/ProcedureScaleForm.dart';
import 'package:project/widgets/forms/ProcedureVentilationForm.dart';

class ProceduresPageState extends State<ProceduresPage> {
  final formKeyRCP = GlobalKey<FormState>();
  final formKeyVentilation = GlobalKey<FormState>();
  final formKeyCirculation = GlobalKey<FormState>();
  final formKeyProtocol = GlobalKey<FormState>();
  final formKeyScale = GlobalKey<FormState>();
  final int victimId;
  final bool enabled;

  ProceduresPageState({this.victimId, this.enabled});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getVictim(victimId),
        builder: (context, victim) {
          if (!victim.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Scaffold(
                appBar: AppBar(title: Text('SIREPH Técnicos')),
                drawer: CustomDrawer(),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProcedureRCPForm(
                        formKey: formKeyRCP,
                        procedureRCP: victim.data.procedureRCP == null
                            ? ProcedureRCP(performed: false, witnessed: false)
                            : victim.data.procedureRCP,
                        enabled: enabled,
                      ),
                      ProcedureVentilationForm(
                        formKey: formKeyVentilation,
                        procedureVentilation:
                            victim.data.procedureVentilation == null
                                ? ProcedureVentilation(
                                    clearance: false,
                                    cpap: false,
                                    endotracheal: false,
                                    laryngealMask: false,
                                    laryngealTube: false,
                                    mechanicalVentilation: false,
                                    oropharyngeal: false)
                                : victim.data.procedureVentilation,
                        enabled: enabled,
                      ),
                      ProcedureCirculationForm(
                        formKey: formKeyCirculation,
                        procedureCirculation:
                            victim.data.procedureCirculation == null
                                ? ProcedureCirculation(
                                    compression: false,
                                    ecg: false,
                                    patch: false,
                                    pelvicBelt: false,
                                    temperatureMonitoring: false,
                                    tourniquet: false,
                                    venousAccess: false)
                                : victim.data.procedureCirculation,
                        enabled: enabled,
                      ),
                      ProcedureProtocolForm(
                          formKey: formKeyProtocol,
                          procedureProtocol:
                              victim.data.procedureProtocol == null
                                  ? ProcedureProtocol(
                                      immobilization: false,
                                      siv: false,
                                      teph: false,
                                      vv_avc: false,
                                      vv_coronary: false,
                                      vv_pcr: false,
                                      vv_sepsis: false,
                                      vv_trauma: false)
                                  : victim.data.procedureProtocol,
                          enabled: enabled),
                      ProcedureScaleForm(
                        formKey: formKeyScale,
                        procedureScale: victim.data.procedureScale == null
                            ? ProcedureScale()
                            : victim.data.procedureScale,
                        enabled: enabled,
                      ),
                      Visibility(
                        visible: enabled,
                        child: Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: ElevatedButton.icon(
                            label: Text(
                              'Salvar',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            icon: Icon(
                              Icons.save,
                              size: 50.0,
                            ),
                            onPressed: () async {
                              if (formKeyVentilation.currentState.validate()) {
                                formKeyVentilation.currentState.save();
                                try {} catch (e) {
                                  showToast("Erro ao Guardar Procedimentos");
                                }
                              } else {
                                showToast("Valor(es) Inválido(s)");
                              }
                            },
                            style: ButtonStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          }
        });
  }
}
