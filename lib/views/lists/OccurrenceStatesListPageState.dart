import 'package:flutter/material.dart';
import 'package:project/models/OccurrenceState.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/dialogs/AddOccurrenceStateDialog.dart';
import 'package:project/widgets/lists/OccurrenceStatesListPage.dart';

class OccurrenceStatesListPageState extends State<OccurrenceStatesListPage> {
  final String title;
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
      {this.occurrenceStates, this.occurrenceId, this.enabled, this.title});

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
                itemCount: occurrenceStates.length,
                itemBuilder: (context, index) {
                  OccurrenceState occurrenceState = occurrenceStates[index];
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
}
