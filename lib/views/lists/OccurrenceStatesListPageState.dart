import 'package:flutter/material.dart';
import 'package:project/models/OccurrenceState.dart';
import 'package:project/utils/Rest.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/dialogs/AddOccurrenceStateDialog.dart';
import 'package:project/widgets/lists/OccurrenceStatesListPage.dart';

class OccurrenceStatesListPageState extends State<OccurrenceStatesListPage> {
  final List<OccurrenceState> occurrenceStates;
  final bool enabled;
  final int occurrenceId;

  void addState(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AddOccurrenceStateDialog(
          occurrenceId: occurrenceId,
          occurrenceState: OccurrenceState(),
        );
      },
    ).then((value) {
      if (value == 'add') setState(() {});
    });
  }

  OccurrenceStatesListPageState(
      {this.occurrenceStates, this.occurrenceId, this.enabled});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, states) {
        if (!states.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            appBar: AppBar(title: Text('SIREPH Técnicos')),
            drawer: CustomDrawer(),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: Text(
                        'Estados',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: states.data.length,
                      itemBuilder: (context, index) {
                        OccurrenceState occurrenceState = states.data[index];
                        return Center(
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(occurrenceState.state.state +
                                      ' - ' +
                                      occurrenceState.dateTime.toString()),
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
                            'Adicionar Estado',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          icon: Icon(
                            Icons.assignment_outlined,
                            size: 50.0,
                          ),
                          onPressed: () => {
                            addState(context),
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
      },
      future: getStates(occurrenceStates, occurrenceId),
    );
  }
}

Future<List<OccurrenceState>> getStates(
    List<OccurrenceState> occurrenceStates, int occurrenceId) async {
  if (occurrenceStates == null) {
    return await getOccurrenceStatesList(occurrenceId);
  } else {
    return occurrenceStates;
  }
}
