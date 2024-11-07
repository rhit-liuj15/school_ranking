import 'package:flutter/material.dart';
import 'package:p01_final_project/components/sortable_table.dart';
import 'package:p01_final_project/models/all_school_data.dart';
import 'package:p01_final_project/models/school_data.dart';


class AllSchoolsPage extends StatefulWidget {
  const AllSchoolsPage({super.key});

  @override
  State<AllSchoolsPage> createState() => _AllSchoolsPageState();
}

class _AllSchoolsPageState extends State<AllSchoolsPage> {
	
	late final List<SchoolData> allSchools = AllSchoolData.instance.allSchools;
  late final List<bool> selected = List<bool>.generate(allSchools.length, (int index) => false);

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
      body: Center(
				child: SortableSchoolTable(),
				// DataTable(
				//           columns: const [
				//             DataColumn(label: Text('Name')),
				//             DataColumn(label: Text('State')),
				//             DataColumn(label: Text('Student Population')),
				//             DataColumn(label: Text('Add to Compare')),
				//           ],
				//           rows: List<DataRow>.generate(
				// 		allSchools.length,
				// 		(int index) =>  DataRow(
				// 			color: WidgetStatePropertyAll(index.isEven? Colors.grey.shade300 : Colors.grey.shade50),
				// 			cells: [
				// 				DataCell(Text(allSchools[index].schoolName)),
				// 				DataCell(Text(allSchools[index].schoolStateInitials)),
				// 				DataCell(Text(allSchools[index].studentPopulation.toString())),
				// 				DataCell(
				// 					TextButton(
				// 						child: Text(selected[index]?"-":"+"),
				// 						onPressed: () {
				// 							setState(() {
				// 							  selected[index] = !selected[index];
				// 							});
				// 						},
				// 					)
				// 				),
				//             	],
				// 			selected: selected[index],
				// 			onSelectChanged: (bool? value) {
				// 				setState(() {
				// 					selected[index] = value!;
				// 				});
				// 			},
				// 		),
				//           )
				// ),
			),
    );
  }
}