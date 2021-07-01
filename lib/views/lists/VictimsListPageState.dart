import 'package:flutter/material.dart';
import 'package:project/models/Victim.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/VictimPage.dart';
import 'package:project/widgets/lists/VictimListPage.dart';

class VictimListPageState extends State<VictimListPage> {
  final int occurrenceId;
  final bool enabled;

  VictimListPageState({this.occurrenceId, this.enabled});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SIREPH Técnicos')),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                'Lista de Vítimas',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: listVictims(),
            ),
            Visibility(
              visible: enabled,
              child: Container(
                margin: EdgeInsets.only(top: 20.0),
                child: ElevatedButton.icon(
                  label: Text(
                    'Adicionar Nova Vítima',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  icon: Icon(
                    Icons.person_add,
                    size: 50.0,
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VictimPage(
                        victim: new Victim(
                            evaluations: [],
                            medicalFollowup: false,
                            pharmacies: []),
                        add: true,
                        occurrenceId: occurrenceId,
                        enabled: enabled,
                      ),
                    ),
                  ).then((value) {
                    if (value = 'add' != null) setState(() {});
                  }),
                  style: ButtonStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listVictims() {
    return FutureBuilder(
      builder: (context, victims) {
        if (!victims.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              if (victims.data.length == 0)
                Text('Sem Vítimas adicionadas!')
              else
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: victims.data.length,
                  itemBuilder: (context, index) {
                    Victim victim = victims.data[index];
                    return Center(
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(victim.name),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VictimPage(
                                    victim: victim,
                                    enabled: enabled,
                                    occurrenceId: occurrenceId,
                                    add: false,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
            ],
          );
        }
      },
      future: getOccurrenceVictimsList(occurrenceId),
    );
  }
}
