import 'package:flutter/material.dart';
import 'package:p01_final_project/components/filter_component.dart';
import 'package:p01_final_project/components/sortable_school_table.dart';
import 'package:p01_final_project/models/all_school_data.dart';
import 'package:p01_final_project/models/school_data.dart';

class AllSchoolsPage extends StatefulWidget {
  const AllSchoolsPage({super.key});

  @override
  State<AllSchoolsPage> createState() => _AllSchoolsPageState();
}

class _AllSchoolsPageState extends State<AllSchoolsPage> {
  late final List<SchoolData> allSchools = AllSchoolData.instance.allSchools;
  late final List<bool> selected =
      List<bool>.generate(allSchools.length, (int index) => false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("School Ranking List"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
				child: Padding(
					padding: EdgeInsets.all(40.0),
					child: Row(
					  children: [
					    FilterComponent(),
					    Placeholder(),
					    Expanded(child: SortableSchoolTable()),
					  ],
					),
      )),
    );
  }
}
