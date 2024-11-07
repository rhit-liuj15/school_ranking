
import 'package:flutter/material.dart';
import 'package:p01_final_project/components/school_data_row.dart';
import 'package:p01_final_project/models/all_school_data.dart';
import 'package:p01_final_project/models/school_data.dart';

class SortableSchoolTable extends StatefulWidget {
  const SortableSchoolTable({super.key});

  @override
  _SortableSchoolTableState createState() => _SortableSchoolTableState();
}

class _SortableSchoolTableState extends State<SortableSchoolTable> {
  List<SchoolData> schoolList = AllSchoolData.instance.allSchools;
  bool sortAscending = true;

	@override
  void initState() {
    super.initState();
  }

  void sortData(String attribute) {
    setState(() {
      schoolList.sort((a, b) {
        int compareResult;
        switch (attribute) {
          case 'name':
            compareResult = a.schoolName.compareTo(b.schoolName);
            break;
          case 'state':
            compareResult = a.schoolStateInitials.compareTo(b.schoolStateInitials);
            break;
          case 'studentPopulation':
            compareResult = a.studentPopulation.compareTo(b.studentPopulation);
            break;
          default:
            throw("The attribute '$attribute' is not supported by the SortableSchoolTable");
        }
        return sortAscending ? compareResult : -compareResult;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
			padding: const EdgeInsets.all(8),
			child: Column(
				children: [
					Row(
						children: [
							Expanded(
								flex: 4,
								child: InkWell(
									onTap: () => sortData('name'),
									child: const Text('Name', textAlign: TextAlign.center),
								),
							),
							Expanded(
								flex: 2,
								child: 
								InkWell(
									onTap: () => sortData('state'),
									child: const Text('State', textAlign: TextAlign.center),
								),
							),
							Expanded(
								flex: 7,
								child: TextButton(
									onPressed: () => sortData('studentPopulation'),
									child: const Text('Students', textAlign: TextAlign.center),
								),
							),
						],
					),
					Expanded(
						child: ListView.builder(
							itemCount: schoolList.length,
							itemBuilder: (context, index) {
								return Visibility(visible: true, child: SchoolDataRow(school: schoolList[index]));
							},
						),
					),
				],
			),
		);
  }
}