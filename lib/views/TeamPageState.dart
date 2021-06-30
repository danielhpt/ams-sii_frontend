import 'package:flutter/material.dart';
import 'package:progress_indicator_button/progress_button.dart';
import 'package:project/models/Team.dart';
import 'package:project/models/TeamTechnician.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/utils/Utils.dart';
import 'package:project/widgets/CreateTeamPage.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/TeamPage.dart';

class TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        drawer: CustomDrawer(),
        body: Center(
          child: listTeam(),
        ));
  }

  Widget listTeam() {
    return FutureBuilder(
      builder: (context, teamUser) {
        if (!teamUser.hasData) {
          return Center(child: CircularProgressIndicator());
        } else if (teamUser.data.technicians == null) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Sem equipa no momento!',
                    style: TextStyle(fontSize: 20.0)),
                Text('User ID: ' + user.id.toString(),
                    style: TextStyle(fontSize: 20.0)),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  constraints: BoxConstraints.tightFor(width: 200, height: 150),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CreateTeamPage(
                            title: 'SIREPH Técnicos Home Page');
                      })).then((value) => setState(() {}));
                    },
                    style: ButtonStyle(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.group_add_sharp,
                          size: 70.0,
                        ),
                        Text(
                          'Criar Equipa',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ]);
        } else {
          return Container(
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: teamUser.data.technicians.length,
                    itemBuilder: (context, index) {
                      TeamTechnician technician =
                          teamUser.data.technicians[index];
                      return Visibility(
                        visible: technician.isActive,
                        child: Center(
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(technician.getFullName()),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  leading: CircleAvatar(),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                if (isTeamLeader(teamUser.data))
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                    child: ProgressButton(
                      color: Colors.red,
                      child: Text(
                        'Desmanchar Equipa',
                        style: TextStyle(fontSize: 20),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      strokeWidth: 2,
                      onPressed: (AnimationController controller) async {
                        controller.forward();
                        for (TeamTechnician t in teamUser.data.technicians) {
                          t.isActive = false;
                        }
                        try {
                          var s = await putTeam(
                              teamUser.data.id, teamUser.data.toJson());
                          controller.reset();
                          setState(() {});
                        } catch (e) {
                          controller.reset();
                          showToast("Erro ao Desmanchar a Equipa");
                        }
                      },
                    ),
                  )
                else
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                    child: ProgressButton(
                      color: Colors.red,
                      child: Text(
                        'Sair',
                        style: TextStyle(fontSize: 20),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      strokeWidth: 2,
                      onPressed: (AnimationController controller) async {
                        controller.forward();
                        for (TeamTechnician t in teamUser.data.technicians) {
                          if (t.id == user.id) {
                            t.isActive = false;
                          }
                        }
                        try {
                          var s = await putTeam(
                              teamUser.data.id, teamUser.data.toJson());
                          controller.reset();
                          setState(() {});
                        } catch (e) {
                          controller.reset();
                          showToast("Erro ao Sair da Equipa");
                        }
                      },
                    ),
                  ),
              ],
            ),
          );
        }
      },
      future: getUserTeamActive(user.id),
    );
  }

  bool isTeamLeader(Team team) {
    for (TeamTechnician t in team.technicians) {
      if (t.id == user.id) {
        return t.isTeamLeader;
      }
    }
    return false;
  }
}