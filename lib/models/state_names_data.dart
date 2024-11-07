import 'package:http/http.dart' as http;

class StateNamesData {
	// I'm trying my best to guess this is how singleton works in flutter...
	Map<String,String> stateNames = Map<String,String>();
  static final StateNamesData instance = StateNamesData._privateConstructor();

  StateNamesData._privateConstructor() {
		var url = Uri.https('10.0.0.48:4800', 'states');
		var response = http.post(url, body: {'name': 'doodle', 'color': 'blue'});
		print(response);
	}
}

