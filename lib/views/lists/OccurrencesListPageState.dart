import 'package:flutter/material.dart';
import 'package:project/models/Occurrence.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/lists/OccurrencesListPage.dart';

class OccurrencesListPageState extends State<OccurrencesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        drawer: CustomDrawer(),
        body: Center(
          child: listUserOccurrences(),
        ));
  }

  Widget listUserOccurrences() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.data.length == 0) {
          return Text('Sem ocorrências disponíveis!');
        } else {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Occurrence occurrence = snapshot.data[index];
                return Center(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(occurrence.id.toString() +
                              ' - ' +
                              occurrence.municipality),
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
      future: getUserOccurrencesList(user.id),
    );
  }
}
