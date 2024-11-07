import 'package:flutter/material.dart';
import 'package:p01_final_project/models/school_data.dart';

class SchoolDataRow extends StatelessWidget {
  final SchoolData school;
	final TextStyle textStyle = const TextStyle(fontSize: 16.0);
	
  const SchoolDataRow({
		super.key,
		required this.school
	});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: Text(
              school.schoolName,
              style: textStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              school.schoolStateInitials,
              style: textStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              '${school.studentPopulation}',
              textAlign: TextAlign.end,
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}