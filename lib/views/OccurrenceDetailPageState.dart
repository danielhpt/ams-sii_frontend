import 'dart:io';

import 'package:flutter/material.dart';
import 'package:progress_indicator_button/progress_button.dart';
import 'package:project/models/Occurrence.dart';
import 'package:project/models/Team.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/utils/Utils.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/OccurrenceDetailPage.dart';
import 'package:project/widgets/forms/OccurrenceForm.dart';
import 'package:project/widgets/TeamPage.dart';
import 'package:project/widgets/lists/VictimListPage.dart';

class OccurrenceDetailPageState extends State<OccurrenceDetailPage> {
  final formKey = GlobalKey<FormState>();
  final Occurrence occurrence;

  OccurrenceDetailPageState({this.occurrence});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text(
                'Informação da Ocorrência',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            OccurrenceForm(
              occurrence: this.occurrence,
              formKey: this.formKey,
              enabled: true,
            ),
            Container(
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
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TeamPage(title: 'SIREPH Técnicos Home Page'))),
                style: ButtonStyle(),
              ),
            ),
            Container(
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
                            title: 'SIREPH Técnicos Home Page',
                            occurrenceId: occurrence.id))),
                style: ButtonStyle(),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
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
                        s = await putOccurrence(occurrence.id, occurrence.toJson());
                      } else {
                        occurrence.id = 0;
                        s = await postTeamOccurrence(team.id, occurrence.toJson());
                      }

                      controller.reset();
                      Navigator.pop(context);
                    } catch (e) {
                      controller.reset();
                      showToast("Erro ao Gravar Ocorrência");
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
