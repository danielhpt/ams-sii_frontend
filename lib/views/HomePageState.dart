import 'package:flutter/material.dart';
import 'package:project/models/Occurrence.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/HomePage.dart';
import 'package:project/widgets/OccurrenceDetailPage.dart';
import 'package:project/widgets/TeamPage.dart';
import 'package:project/widgets/lists/OccurrencesListPage.dart';

class HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, userLogged) {
        if (!userLogged.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            appBar: AppBar(title: Text('SIREPH Técnicos')),
            drawer: CustomDrawer(),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      constraints:
                          BoxConstraints.tightFor(width: 300, height: 200),
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OccurrencesListPage())),
                        style: ButtonStyle(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.history,
                              size: 70.0,
                            ),
                            Text(
                              'Histórico de Ocorrências',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      constraints:
                          BoxConstraints.tightFor(width: 300, height: 200),
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TeamPage())),
                        style: ButtonStyle(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.group,
                              size: 70.0,
                            ),
                            Text(
                              'Gerir Equipa',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      constraints:
                          BoxConstraints.tightFor(width: 300, height: 200),
                      child: ElevatedButton(
                        onPressed: () async {
                          Occurrence occurrence;
                          bool newOccurrence;

                          try {
                            occurrence = await getUserActiveOccurrence(user.id);
                            newOccurrence = false;
                          } catch (e) {
                            occurrence = Occurrence(states: [], victims: []);
                            newOccurrence = true;
                          }

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OccurrenceDetailPage(
                                        occurrence: occurrence,
                                        enabled: true,
                                        newOccurrence: newOccurrence,
                                      ))).then((value) {
                            if (value == 'create') {
                              setState(() {});
                            }
                          });
                        },
                        style: ButtonStyle(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.assignment_late,
                              size: 70.0,
                            ),
                            Text(
                              'Abrir Ocorrência',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
      future: getUserByToken(),
    );
  }
}

void goto() {}
