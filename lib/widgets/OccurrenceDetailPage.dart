import 'package:flutter/material.dart';
import 'package:project/models/Occurrence.dart';
import 'package:project/views/OccurrenceDetailPageState.dart';

class OccurrenceDetailPage extends StatefulWidget {
  final Occurrence occurrence;
  final bool enabled;
  final bool newOccurrence;

  OccurrenceDetailPage({Key key, this.occurrence, this.enabled, this.newOccurrence})
      : super(key: key);

  @override
  OccurrenceDetailPageState createState() =>
      OccurrenceDetailPageState(occurrence: this.occurrence, enabled: enabled, newOccurrence: newOccurrence);
}
