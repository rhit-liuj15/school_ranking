import 'package:http/http.dart' as http;

class StateNamesData {
	// I'm trying my best to guess this is how singleton works in flutter...
	Map<String,String> stateNames = Map<String,String>();
  static final StateNamesData instance = StateNamesData._privateConstructor();

  StateNamesData._privateConstructor() {
		var url = Uri.http('10.0.0.48:4800', 'states');
		// var url = Uri.http('ethan02.us:4800', 'states');
		()async{
			try {
				final response = await http.get(url);
				// Flutter enforces CORS. The needed change is performed server-side.
				if (response.statusCode == 200) {
					print('Response data: ${response.body}');
				} else {
					print('Failed to load data. HTTP Status Code: ${response.statusCode}');
				}
			} catch (e) {
				print('Error occurred: $e');
			}
		}();
	}
}

