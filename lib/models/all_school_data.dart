import 'package:p01_final_project/models/school_data.dart';

class AllSchoolData {
	// I'm trying my best to guess this is how singleton works in flutter...
	late List<SchoolData> allSchools;
  static final AllSchoolData instance = AllSchoolData._privateConstructor();

  AllSchoolData._privateConstructor() {
		allSchools = [];
		allSchools.add(SchoolData(uid: 127059, schoolName: "My school A", schoolStateInitials: "AK", studentPopulation: 2379));
    allSchools.add(SchoolData(uid: 193570, schoolName: "My school C", schoolStateInitials: "CA", studentPopulation: 18596));
    allSchools.add(SchoolData(uid: 150793, schoolName: "My school D", schoolStateInitials: "DE", studentPopulation: 7925));
	}
}