import 'package:flutter/material.dart';
import 'package:progress_indicator_button/progress_button.dart';
import 'package:project/models/Occurrence.dart';
import 'package:project/models/Team.dart';
import 'package:project/models/TeamTechnician.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/utils/Utils.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/OccurrenceDetailPage.dart';
import 'package:project/widgets/forms/OccurrenceForm.dart';
import 'package:project/widgets/lists/OccurrenceStatesListPage.dart';
import 'package:project/widgets/lists/VictimListPage.dart';

class OccurrenceDetailPageState extends State<OccurrenceDetailPage> {
  final formKey = GlobalKey<FormState>();
  final Occurrence occurrence;
  final bool enabled;
  final bool newOccurrence;

  OccurrenceDetailPageState(
      {this.newOccurrence, this.enabled, this.occurrence});

  bool isTeamLeader(Team team) {
    for (TeamTechnician t in team.technicians) {
      if (t.id == user.id) {
        return t.isTeamLeader;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, team) {
        if (!team.hasData) {
          return Center(child: CircularProgressIndicator());
        } else if (team.data.id == null && enabled) {
          return Scaffold(
            appBar: AppBar(title: Text('SIREPH Técnicos')),
            drawer: CustomDrawer(),
            body: Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Center(
                  child: Text(
                    'Deve estar em uma Equipa',
                    style: TextStyle(fontSize: 20.0),
                  ),
                )),
          );
        } else {
          return Scaffold(
            appBar: AppBar(title: Text('SIREPH Técnicos')),
            drawer: CustomDrawer(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Text(
                      newOccurrence
                          ? 'Nova Ocorrência'
                          : 'Informação da Ocorrência',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  OccurrenceForm(
                    occurrence: this.occurrence,
                    formKey: this.formKey,
                    enabled: enabled,
                  ),
                  Visibility(
                    visible: !newOccurrence,
                    child: Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: ElevatedButton.icon(
                        label: Text(
                          'Estados da Ocorrência',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        icon: Icon(
                          Icons.gps_fixed,
                          size: 50.0,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OccurrenceStatesListPage(
                                        occurrenceStates: occurrence.states,
                                        enabled: enabled,
                                        occurrenceId: occurrence.id,
                                      )));
                        },
                        style: ButtonStyle(),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !newOccurrence,
                    child: Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: ElevatedButton.icon(
                        label: Text(
                          'Gerir Vítimas',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        icon: Icon(
                          Icons.group,
                          size: 50.0,
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VictimListPage(
                                      occurrenceId: occurrence.id,
                                      enabled: enabled,
                                    ))),
                        style: ButtonStyle(),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: enabled,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                      child: ProgressButton(
                        color: Colors.green,
                        child: Text(
                          'Gravar Informação',
                          style: TextStyle(fontSize: 20),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        strokeWidth: 2,
                        onPressed: (AnimationController controller) async {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();

                            controller.forward();
                            try {
                              var s;
                              Team team = await getUserTeamActive(user.id);
                              occurrence.team = team;

                              if (occurrence.id != null) {
                                s = await putOccurrence(
                                    occurrence.id, occurrence.toJson());
                              } else {
                                occurrence.id = 0;
                                s = await postTeamOccurrence(
                                    team.id, occurrence.toJson());
                              }

                              controller.reset();
                              if (newOccurrence) {
                                Navigator.pop(context, 'create');
                              } else {
                                Navigator.pop(context);
                              }
                            } catch (e) {
                              controller.reset();
                              showToast("Erro ao Gravar Ocorrência");
                            }
                          }
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: (isTeamLeader(team.data) && enabled && newOccurrence),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                      child: ProgressButton(
                        color: Colors.red,
                        child: Text(
                          'Terminar Ocorrência',
                          style: TextStyle(fontSize: 20),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        strokeWidth: 2,
                        onPressed: (AnimationController controller) async {
                          controller.forward();
                          bool r = await putUserActiveOccurrence(user.id);
                          controller.reset();
                          if (r) {
                            Navigator.pop(context);
                          } else {
                            showToast("Erro ao Terminar a Ocorrência");
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
      future: getUserTeamActive(user.id),
    );
  }
}
