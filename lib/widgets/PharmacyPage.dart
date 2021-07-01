import 'package:flutter/material.dart';
import 'package:project/models/Pharmacy.dart';
import 'package:project/views/PharmacyPageState.dart';

class PharmacyPage extends StatefulWidget {
  final Pharmacy pharmacy;
  final bool enabled;
  final bool add;
  final int victimId;

  PharmacyPage({Key key, this.pharmacy, this.enabled, this.add, this.victimId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PharmacyPageState(add: add, enabled: enabled, pharmacy: pharmacy, victimId: victimId);
}