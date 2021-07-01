import 'package:flutter/material.dart';
import 'package:progress_indicator_button/progress_button.dart';
import 'package:project/models/Team.dart';
import 'package:project/models/TeamTechnician.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/utils/Utils.dart';
import 'package:project/widgets/dialogs/AddTechnicianDialog.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/CreateTeamPage.dart';

class CreateTeamPageState extends State<CreateTeamPage> {
  Team newTeam = Team.begin(user);

  void addTechnician(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AddTechnicianDialog(
          team: this.newTeam,
        );
      },
    ).then((value) {
      if (value == 'add') setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var teamUser;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: newTeam.technicians.length,
                itemBuilder: (context, index) {
                  TeamTechnician technician = newTeam.technicians[index];
                  return Center(
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
                  );
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                child: ElevatedButton(
                  onPressed: () => {
                    addTechnician(context),
                  },
                  child: Text(
                    'Adicionar Técnico',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                child: ProgressButton(
                  color: Colors.green,
                  child: Text(
                    'Criar Equipa',
                    style: TextStyle(fontSize: 20),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  strokeWidth: 2,
                  onPressed: (AnimationController controller) async {
                    controller.forward();
                    try {
                      var s = await postUserTeam(user.id, newTeam.toJson());
                      controller.reset();
                      Navigator.pop(context);
                    } catch (e) {
                      controller.reset();
                      showToast("Erro ao Criar a Equipa");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
