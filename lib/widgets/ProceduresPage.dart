import 'package:flutter/material.dart';
import 'package:project/models/procedures/ProcedureRCP.dart';
import 'package:project/views/ProceduresPageState.dart';

class ProceduresPage extends StatefulWidget {
  final int victimId;
  final bool enabled;

  ProceduresPage({Key key, this.victimId, this.enabled}) : super(key: key);

  @override
  ProceduresPageState createState() =>
      ProceduresPageState(victimId: victimId, enabled: enabled);
}
