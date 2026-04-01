import 'package:http/http.dart' as http;
import 'dart:convert';

class JokeService {
  static const String _apiUrl = 'https://api.jokes.one/jod';
  
  /// Fetches a random joke from the API
  /// Returns a string containing the joke
  static Future<String> getRandomJoke() async {
    try {
      final response = await http.get(
        Uri.parse(_apiUrl),
        headers: {
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw Exception('Request timeout'),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final joke = jsonData['contents']['jokes'][0]['joke'] as String;
        return joke;
      } else {
        throw Exception('Failed to load joke: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching joke: $e');
    }
  }
}