
import 'package:flutter/material.dart';
import 'package:p01_final_project/models/state_names_data.dart';

class FilterComponent extends StatefulWidget {
  const FilterComponent({super.key});

  @override
  _FilterComponentState createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  Map<String,String> stateNames = StateNamesData.instance.stateNames;

	@override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}