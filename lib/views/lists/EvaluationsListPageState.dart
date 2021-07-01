import 'package:flutter/material.dart';
import 'package:project/models/Evaluation.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/EvaluationPage.dart';
import 'package:project/widgets/lists/EvaluationsListPage.dart';

class EvaluationsListPageState extends State<EvaluationsListPage> {
  final bool enabled;
  final int victimId;

  EvaluationsListPageState({this.victimId, this.enabled});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getVictimEvaluationsList(victimId),
      builder: (context, evaluations) {
        if (!evaluations.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            appBar: AppBar(title: Text('SIREPH Técnicos')),
            drawer: CustomDrawer(),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: evaluations.data.length,
                      itemBuilder: (context, index) {
                        Evaluation evaluation = evaluations.data[index];
                        return Center(
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text((index + 1).toString() +
                                      ' - ' +
                                      evaluation.hours.toString()),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EvaluationPage(
                                                  enabled: false,
                                                  victimId: victimId,
                                                  evaluation: evaluation,
                                                  add: false,
                                                )));
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Visibility(
                      visible: enabled,
                      child: Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: ElevatedButton.icon(
                          label: Text(
                            'Adicionar Avaliação',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          icon: Icon(
                            Icons.assignment_outlined,
                            size: 50.0,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EvaluationPage(
                                          enabled: enabled,
                                          victimId: victimId,
                                          evaluation: Evaluation(),
                                          add: true,
                                        ))).then((value) {
                              if (value == 'create')
                                setState(() {});
                            });
                          },
                          style: ButtonStyle(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
