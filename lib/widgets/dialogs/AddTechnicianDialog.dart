import 'package:flutter/material.dart';
import 'package:project/models/Team.dart';
import 'package:project/views/dialogs/AddTechnicianDialogState.dart';

class AddTechnicianDialog extends StatefulWidget {
  Team team;

  AddTechnicianDialog({Key key, this.team}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      AddTechnicianDialogState(team: this.team);
}
