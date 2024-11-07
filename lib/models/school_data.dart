class SchoolData {
	int uid;
  String schoolName;
  String schoolStateInitials;
  int studentPopulation;

  SchoolData({
		required this.uid,
    required this.schoolName,
    required this.schoolStateInitials,
    required this.studentPopulation,
  });

  @override
  String toString() {
    return "The school $schoolName is located in state/territory $schoolStateInitials with a student population of $studentPopulation";
  }
}