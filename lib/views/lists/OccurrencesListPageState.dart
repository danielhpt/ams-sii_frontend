import 'package:flutter/material.dart';
import 'package:project/models/Occurrence.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/OccurrenceDetailPage.dart';
import 'package:project/widgets/lists/OccurrencesListPage.dart';

class OccurrencesListPageState extends State<OccurrencesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SIREPH Técnicos')),
        drawer: CustomDrawer(),
        body: Center(
          child: listUserOccurrences(),
        ));
  }

  Widget listUserOccurrences() {
    return FutureBuilder(
      builder: (context, occurrences) {
        if (!occurrences.hasData) {
          return Center(child: CircularProgressIndicator());
        } else if (occurrences.data.length == 0) {
          return Text('Sem ocorrências disponíveis!');
        } else {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Text(
                  'Histórico de Ocorrências',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: occurrences.data.length,
                  itemBuilder: (context, index) {
                    Occurrence occurrence = occurrences.data[index];
                    return Center(
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(occurrence.id.toString() +
                                  ' - ' +
                                  occurrence.municipality),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OccurrenceDetailPage(
                                              occurrence: occurrence,
                                              enabled: false,
                                            )));
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          );
        }
      },
      future: getUserOccurrencesList(user.id),
    );
  }
}
