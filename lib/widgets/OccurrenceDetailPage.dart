import 'package:flutter/material.dart';
import 'package:project/models/Occurrence.dart';
import 'package:project/views/OccurrenceDetailPageState.dart';

class OccurrenceDetailPage extends StatefulWidget {
  final Occurrence occurrence;
  final String title;

  OccurrenceDetailPage({Key key, this.occurrence, this.title}) : super(key: key);

  @override
  OccurrenceDetailPageState createState() => OccurrenceDetailPageState(occurrence: this.occurrence);
}
