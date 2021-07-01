import 'package:flutter/material.dart';
import 'package:project/models/Victim.dart';
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
            ProcedureRCP procedureRCP = victim.data.procedureRCP == null
                ? ProcedureRCP(performed: false, witnessed: false)
                : victim.data.procedureRCP;
            ProcedureVentilation procedureVentilation =
                victim.data.procedureVentilation == null
                    ? ProcedureVentilation(
                        clearance: false,
                        cpap: false,
                        endotracheal: false,
                        laryngealMask: false,
                        laryngealTube: false,
                        mechanicalVentilation: false,
                        oropharyngeal: false)
                    : victim.data.procedureVentilation;
            ProcedureCirculation procedureCirculation =
                victim.data.procedureCirculation == null
                    ? ProcedureCirculation(
                        compression: false,
                        ecg: false,
                        patch: false,
                        pelvicBelt: false,
                        temperatureMonitoring: false,
                        tourniquet: false,
                        venousAccess: false)
                    : victim.data.procedureCirculation;
            ProcedureProtocol procedureProtocol =
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
                    : victim.data.procedureProtocol;
            ProcedureScale procedureScale = victim.data.procedureScale == null
                ? ProcedureScale()
                : victim.data.procedureScale;

            return Scaffold(
                appBar: AppBar(title: Text('SIREPH Técnicos')),
                drawer: CustomDrawer(),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProcedureRCPForm(
                        formKey: formKeyRCP,
                        procedureRCP: procedureRCP,
                        enabled: enabled,
                      ),
                      ProcedureVentilationForm(
                        formKey: formKeyVentilation,
                        procedureVentilation: procedureVentilation,
                        enabled: enabled,
                      ),
                      ProcedureCirculationForm(
                        formKey: formKeyCirculation,
                        procedureCirculation: procedureCirculation,
                        enabled: enabled,
                      ),
                      ProcedureProtocolForm(
                          formKey: formKeyProtocol,
                          procedureProtocol: procedureProtocol,
                          enabled: enabled),
                      ProcedureScaleForm(
                        formKey: formKeyScale,
                        procedureScale: procedureScale,
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
                              if (formKeyRCP.currentState.validate() &&
                                  formKeyVentilation.currentState.validate() &&
                                  formKeyCirculation.currentState.validate() &&
                                  formKeyProtocol.currentState.validate() &&
                                  formKeyScale.currentState.validate()) {
                                formKeyRCP.currentState.save();
                                formKeyVentilation.currentState.save();
                                formKeyCirculation.currentState.save();
                                formKeyProtocol.currentState.save();
                                formKeyScale.currentState.save();

                                try {
                                  await saveProcedures(
                                      victim.data,
                                      procedureRCP,
                                      procedureVentilation,
                                      procedureCirculation,
                                      procedureProtocol,
                                      procedureScale);
                                } catch (e) {
                                  showToast("Erro ao Gravar Procedimentos");
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

Future<void> saveProcedures(
    Victim victim,
    ProcedureRCP procedureRCP,
    ProcedureVentilation procedureVentilation,
    ProcedureCirculation procedureCirculation,
    ProcedureProtocol procedureProtocol,
    ProcedureScale procedureScale) async {
  if (victim.procedureRCP == null)
    await postProcedureRCP(victim.id, procedureRCP.toJson());
  else
    await putProcedureRCP(victim.id, procedureRCP.toJson());

  if (victim.procedureVentilation == null)
    await postProcedureVentilation(victim.id, procedureVentilation.toJson());
  else
    await putProcedureVentilation(victim.id, procedureVentilation.toJson());

  if (victim.procedureCirculation == null)
    await postProcedureCirculation(victim.id, procedureCirculation.toJson());
  else
    await putProcedureCirculation(victim.id, procedureCirculation.toJson());

  if (victim.procedureProtocol == null)
    await postProcedureProtocol(victim.id, procedureProtocol.toJson());
  else
    await putProcedureProtocol(victim.id, procedureProtocol.toJson());

  if (victim.procedureScale == null)
    await postProcedureScale(victim.id, procedureScale.toJson());
  else
    await putProcedureScale(victim.id, procedureScale.toJson());
}
