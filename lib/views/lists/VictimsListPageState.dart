import 'package:flutter/material.dart';
import 'package:project/models/Victim.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/lists/VictimListPage.dart';

class VictimListPageState  extends State<VictimListPage>  {
  final int occurrenceId;

  VictimListPageState(this.occurrenceId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        drawer: CustomDrawer(),
        body: Center(
          child: listVictims(),
        ));
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
                          onTap: () {},
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
