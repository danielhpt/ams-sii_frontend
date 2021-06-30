import 'package:flutter/material.dart';
import 'package:project/models/Occurrence.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/Drawer.dart';
import 'package:project/widgets/OccurrenceHistory.dart';

class OccurrenceHistoryState  extends State<OccurrenceHistory>  {
  int userId = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        drawer: MyDrawer(),
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
                          title: Text(occurrence.id.toString()),
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
      future: getUserOccurrencesList(userId), //esta função tem de retornar uma Future
    );
  }
}
