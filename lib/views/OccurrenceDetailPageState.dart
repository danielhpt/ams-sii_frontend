import 'package:flutter/material.dart';
import 'package:project/models/Occurrence.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/OccurrenceDetailPage.dart';
import 'package:project/widgets/forms/OccurrenceForm.dart';
import 'package:project/widgets/TeamPage.dart';
import 'package:project/widgets/lists/VictimListPage.dart';
import 'package:project/widgets/forms/OccurrenceForm.dart';

class OccurrenceDetailPageState extends State<OccurrenceDetailPage> {
  final formKey = GlobalKey<FormState>();
  final Occurrence occurrence;

  OccurrenceDetailPageState({this.occurrence});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OccurrenceForm(
              occurrence: this.occurrence,
              formKey: this.formKey,
              enabled: true,
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: ElevatedButton.icon(
                label: Text(
                  'Estados da Ocorrência',
                  style: TextStyle(fontSize: 20.0),
                ),
                icon: Icon(
                  Icons.gps_fixed,
                  size: 50.0,
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TeamPage(title: 'SIREPH Técnicos Home Page'))),
                style: ButtonStyle(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: ElevatedButton.icon(
                label: Text(
                  'Gerir Vítimas',
                  style: TextStyle(fontSize: 20.0),
                ),
                icon: Icon(
                  Icons.group,
                  size: 50.0,
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VictimListPage(
                            title: 'SIREPH Técnicos Home Page',
                            occurrenceId: occurrence.id))),
                style: ButtonStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
