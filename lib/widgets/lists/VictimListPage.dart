import 'package:flutter/material.dart';
import 'package:project/views/lists/VictimsListPageState.dart';

class VictimListPage extends StatefulWidget {
  final int occurrenceId;
  final bool enabled;

  VictimListPage({Key key, this.occurrenceId, this.enabled}) : super(key: key);

  @override
  VictimListPageState createState() => VictimListPageState(occurrenceId: occurrenceId, enabled: enabled,);
}
