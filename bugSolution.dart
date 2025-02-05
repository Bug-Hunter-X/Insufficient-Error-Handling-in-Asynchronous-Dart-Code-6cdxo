```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = json.decode(response.body);
        return jsonData as Map<String, dynamic>?; 
      } catch (e) {
        print('Error decoding JSON: $e');
        // Optional: rethrow or return null based on your application logic
        return null; 
      }
    } else {
      print('HTTP Error: ${response.statusCode} - ${response.reasonPhrase}');
      // Optionally throw a custom error or return null
      throw Exception('HTTP request failed with status: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    print('Network Error: $e');
    // Handle Network issues appropriately
    return null; //Or throw an exception.
  } catch (e) {
    print('Unexpected error: $e');
    rethrow; // Re-throw to be handled at a higher level, if necessary
  }
}
```