import 'package:flutter/material.dart';
import 'package:project/models/OccurrenceState.dart';
import 'package:project/views/dialogs/AddOccurrenceStateDialogState.dart';

class AddOccurrenceStateDialog extends StatefulWidget {
  final int occurrenceId;
  final OccurrenceState occurrenceState;

  AddOccurrenceStateDialog({Key key, this.occurrenceId, this.occurrenceState})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => AddOccurrenceStateDialogState(
      occurrenceId: occurrenceId, occurrenceState: occurrenceState);
}
