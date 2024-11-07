
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
  List<SchoolData> schoolList = [];
	int sortingBy = 0; // Sorting by name: 0, Sorting by state: 1, Sorting by student population: 2
	bool sortAscending = true;
	final TextStyle textStyle = const TextStyle(fontSize: 18.0);

	@override
  void initState() {
    super.initState();
    loadData();
  }

  // Asynchronously load data from the singleton instance
  Future<void> loadData() async {
    await AllSchoolData.instance.loadData();
    setState(() {
      schoolList = AllSchoolData.instance.allSchools;
    });
  }

  void sortData(String attribute) {
    setState(() {
			switch (attribute) {
				case 'name':
					if (sortingBy == 0) {
						sortAscending = !sortAscending;
					} else {
						sortingBy = 0;
						sortAscending = true;
					}
					break;
				case 'state':
					if (sortingBy == 1) {
						sortAscending = !sortAscending;
					} else {
						sortingBy = 1;
						sortAscending = true;
					}
					break;
				case 'studentPopulation':
					if (sortingBy == 2) {
						sortAscending = !sortAscending;
					} else {
						sortingBy = 2;
						sortAscending = true;
					}
					break;
				case 'uid':
					sortingBy = -1;
					sortAscending = true;
				default:
					throw("The attribute '$attribute' is not supported by the SortableSchoolTable");
			}
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
          case 'uid':
            compareResult = a.uid.compareTo(b.uid);
            break;
          default:
            throw("The attribute '$attribute' is not supported by the SortableSchoolTable");
        }
				if (compareResult == 0) {
					return a.uid.compareTo(b.uid); // Backup sort, UID is guaranteed unique
				}
        return sortAscending ? compareResult : -compareResult;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
			children: [
				const Expanded(
					flex: 2,
					child: Card(
						child: Column(
						  children: [
						    Text("This is the filter tab", textAlign: TextAlign.center,),
						  ],
						),
					),
				),
				const SizedBox(width: 30.0,),
				Expanded(
					flex: 5,
					child: Column(
						children: [
							Row(
								children: [
									Expanded(
										flex: 9,
										child: InkWell(
											onTap: () => sortData('name'),
											child: Text('Name', textAlign: TextAlign.center, style: textStyle),
										),
									),
									Expanded(
										flex: 2,
										child: 
										InkWell(
											onTap: () => sortData('state'),
											child: Text('State', textAlign: TextAlign.center, style: textStyle),
										),
									),
									Expanded(
										flex: 3,
										child: InkWell(
											onTap: () => sortData('studentPopulation'),
											child: Text('Students', textAlign: TextAlign.center, style: textStyle),
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
				),
			],
		);
  }
}