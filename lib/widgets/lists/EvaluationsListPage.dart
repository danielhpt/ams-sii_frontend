import 'package:flutter/material.dart';
import 'package:project/views/lists/EvaluationsListPageState.dart';

class EvaluationsListPage extends StatefulWidget {
  final bool enabled;
  final int victimId;

  EvaluationsListPage({Key key, this.enabled, this.victimId})
      : super(key: key);

  @override
  EvaluationsListPageState createState() => EvaluationsListPageState(
      victimId: victimId, enabled: enabled);
}
