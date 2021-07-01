import 'package:flutter/material.dart';
import 'package:project/models/Evaluation.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/EvaluationsListPage.dart';

class EvaluationsListPageState extends State<EvaluationsListPage> {
  final String title;
  final List<Evaluation> evaluations;
  final bool enabled;

  EvaluationsListPageState({this.enabled, this.title, this.evaluations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: evaluations.length,
                itemBuilder: (context, index) {
                  Evaluation evaluation = evaluations[index];
                  return Center(
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text((index + 1).toString() +
                                ' - ' +
                                evaluation.hours.toString()),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: () {},
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
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EvaluationPage(
                                  title: 'SIREPH Técnicos Home Page',
                                  enabled: true)));*/
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
}
