import 'package:flutter/material.dart';
import 'package:project/models/OccurrenceState.dart';
import 'package:project/views/lists/OccurrenceStatesListPageState.dart';

class OccurrenceStatesListPage extends StatefulWidget {
  final List<OccurrenceState> occurrenceStates;
  final bool enabled;
  final int occurrenceId;

  OccurrenceStatesListPage(
      {Key key,
      this.occurrenceStates,
      this.enabled,
      this.occurrenceId})
      : super(key: key);

  @override
  OccurrenceStatesListPageState createState() => OccurrenceStatesListPageState(
      occurrenceStates: occurrenceStates,
      enabled: enabled,
      occurrenceId: occurrenceId);
}
