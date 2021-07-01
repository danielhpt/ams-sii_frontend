import 'package:flutter/material.dart';
import 'package:project/models/OccurrenceState.dart';
import 'package:project/views/lists/OccurrenceStatesListPageState.dart';

class OccurrenceStatesListPage extends StatefulWidget {
  final String title;
  final List<OccurrenceState> occurrenceStates;
  final bool enabled;
  final int occurrenceId;

  OccurrenceStatesListPage(
      {Key key,
      this.title,
      this.occurrenceStates,
      this.enabled,
      this.occurrenceId})
      : super(key: key);

  @override
  OccurrenceStatesListPageState createState() => OccurrenceStatesListPageState(
      title: title,
      occurrenceStates: occurrenceStates,
      enabled: enabled,
      occurrenceId: occurrenceId);
}
