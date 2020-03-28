import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:moviehub/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NetworkUtils {
  static final String baseUrl =
      "https://api.themoviedb.org/3/discover/movie?api_key=";

  // Builds a url according to the shared preferences
  static Future<String> urlBuilder() async {
    List<String> headers = List();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> filters = preferences.getStringList("filters");
    String sort = preferences.getString("sort");

    await DotEnv().load(".env");

    headers.add(DotEnv().env["apiKey"]); // Add API key to the headers list

    if (filters != null) headers.addAll(filters);
    if (sort != null) headers.add("sort_by=" + sort);

    String header = headers.join("&");

    return baseUrl + header;
  }

  // Returns the movies parsed into objects of the Movie class
  static Future<List<Movie>> fetchMovies(String text) async {
    List<Movie> movies = new List();

    String url = await urlBuilder();
    print(url);
    final response = await http.get(url);

    List<Map<String, dynamic>> movieJson =
        json.decode(response.body)['products'];

    if (response.statusCode == 200 && movieJson != null) {
      for (Map<String, dynamic> movie in movieJson) {
        movies.add(Movie()); // TODO: Add JSON data to object
      }

      return movies;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
