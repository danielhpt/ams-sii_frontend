import 'package:flutter/material.dart';
import 'package:project/models/Victim.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/VictimPage.dart';
import 'package:project/widgets/lists/VictimListPage.dart';

class VictimListPageState extends State<VictimListPage> {
  final int occurrenceId;

  VictimListPageState(this.occurrenceId);

  Victim newVictim = new Victim(
    evaluations: [],
    medicalFollowup: false,
    pharmacies: []
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        drawer: CustomDrawer(),
        body: Center(
            child: Column(children: [
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
              Container(
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
                          builder: (context) =>
                              VictimPage(victim: newVictim, title: 'SIREPH Técnicos Home Page'))),
                  style: ButtonStyle(),
                ),
              )
        ])));
  }

  Widget listVictims() {
    return FutureBuilder(
      builder: (context, victims) {
        if (!victims.hasData) {
          return Center(child: CircularProgressIndicator());
        } else if (victims.data.length == 0) {
          return Text('Sem Vítimas adicionadas!');
        } else {
          return ListView.builder(
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
                          leading: CircleAvatar(),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      VictimPage(victim: victim, title: 'SIREPH Técnicos Home Page'))),
                        ),
                      ],
                    ),
                  ),
                );
              });
        }
      },
      future: getOccurrenceVictimsList(occurrenceId),
    );
  }
}
