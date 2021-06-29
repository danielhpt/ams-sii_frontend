import 'package:flutter/material.dart';
import 'package:project/models/Team.dart';
import 'package:project/widgets/TeamPage.dart';

class TeamPageState extends State<TeamPage> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: listTeam(),
    );
  }

  Widget listTeam() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.data.length == 0) {
          return Text('Sem equipa no momento!');
        } else {
          return ListView.builder(itemBuilder: (context, index) {
            Team team = snapshot.data[index];
            return Center(
              child: Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      //title: Text(t),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      leading: CircleAvatar(
                      ),
                      onTap: () {

                      },
                    ),
                  ],
                ),
              ),
            );
          });
        }
      },
     //future: , //esta função tem de retornar uma Future
    );
  }

}
