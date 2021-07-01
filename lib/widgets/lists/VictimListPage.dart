import 'package:flutter/material.dart';
import 'package:project/views/lists/VictimsListPageState.dart';


class VictimListPage extends StatefulWidget {
  final String title;
  final int occurrenceId;

  VictimListPage({Key key, this.title, this.occurrenceId}) : super(key: key);

  @override
  VictimListPageState createState() => VictimListPageState(this.occurrenceId);
}