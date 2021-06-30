import 'package:flutter/material.dart';
import 'package:project/models/TeamTechnician.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/Drawer.dart';
import 'package:project/widgets/TeamPage.dart';

class TeamPageState extends State<TeamPage> {
  int userId = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        drawer: MyDrawer(),
        body: Center(
          child: listTeam(),
        ));
  }

  Widget listTeam() {
    return FutureBuilder(
      builder: (context, teamUser) {
        if (!teamUser.hasData) {
          return Center(child: CircularProgressIndicator());
        } else if (teamUser.data.technicians.length == 0) {
          return Text('Sem equipa no momento!');
        } else {
          return ListView.builder(
              itemCount: teamUser.data.technicians.length,
              itemBuilder: (context, index) {
                TeamTechnician technician = teamUser.data.technicians[index];
                return Center(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                              technician.firstName + " " + technician.lastName),
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
      future:
          getUserTeamActive(userId), //esta função tem de retornar uma Future
    );
  }
}
