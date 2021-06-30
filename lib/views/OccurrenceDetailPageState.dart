import 'package:flutter/material.dart';
import 'package:project/models/Occurrence.dart';
import 'package:project/widgets/CustomDrawer.dart';
import 'package:project/widgets/OccurrenceDetailPage.dart';
import 'package:project/widgets/OccurrenceForm.dart';

class OccurrenceDetailPageState extends State<OccurrenceDetailPage> {
  final formKey = GlobalKey<FormState>();
  final Occurrence occurrence;

  OccurrenceDetailPageState({this.occurrence});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            OccurrenceForm(
              occurrence: this.occurrence,
              formKey: this.formKey,
              enabled: true,
            )
        ],
      ),
    ));
  }
}
