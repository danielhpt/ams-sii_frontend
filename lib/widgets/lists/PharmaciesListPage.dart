import 'package:flutter/material.dart';
import 'package:project/models/Pharmacy.dart';
import 'package:project/views/PharmaciesListPageState.dart';

class PharmaciesListPage extends StatefulWidget {
  final String title;
  final List<Pharmacy> pharmacies;
  final bool enabled;

  PharmaciesListPage({Key key, this.title, this.pharmacies, this.enabled}) : super(key: key);

  @override
  PharmaciesListPageState createState() => PharmaciesListPageState(title: title, pharmacies: pharmacies, enabled: enabled);
}