import 'dart:convert';
import 'package:http/http.dart' as http;

class StateNamesData {
	// I'm trying my best to guess this is how singleton works in flutter...
	late Map<String,String> stateNames;
	bool stateNamesReady = false;
  static final StateNamesData instance = StateNamesData._privateConstructor();


  StateNamesData._privateConstructor();

  // Method to load data asynchronously and populate stateNames
  Future<void> loadData() async {
		if (!stateNamesReady) {
			var url = Uri.http('ethan02.us:4800', 'schools');
			try {
				final response = await http.get(url);
				if (response.statusCode == 200) {
					List<dynamic> data = jsonDecode(response.body);
					stateNames = <String,String>{};
					data.map((item) => stateNames[item['Codevalue'] as String] = item['valueLabel'] as String);
					stateNamesReady = true;
				} else {
					print('Failed to load data. HTTP Status Code: ${response.statusCode}');
				}
			} catch (e) {
				print('Error occurred: $e');
			}
		}
  }
}

