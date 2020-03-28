//import 'dart:convert';
//import 'dart:io';
//
//import 'package:moviehub/screen_components/movie_card.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:http/http.dart' as http; // TODO: Doesn't seem to work
//
//class NetworkUtils {
//
//  final String baseUrl = "https://api.themoviedb.org/3/discover/movie?api_key=";
//
//  // Builds a url according to the shared preferences
//  Future<String> urlBuilder() async {
//    SharedPreferences preferences = await SharedPreferences.getInstance();
//    List<String> filters = preferences.getStringList("filters");
//    String sort = preferences.getString("sort");
//
//    String apiKey = await new File('json/config.json')
//        .readAsString()
//        .then((fileContents) => json.decode(fileContents))
//        .then((jsonData) {
//          return jsonData['apiKey'];
//        });
//
//    filters.insert(0, apiKey);
//    filters.add(sort);
//
//    String headers = filters.join("&");
//
//    return baseUrl + headers;
//  }
//
//  // Returns the movies parsed into objects of the Movie class
//  Future<List<Movie>> fetchMovies(String text) async {
//    List<Movie> movies = new List();
//
//    String url = await urlBuilder();
//    print(url);
//    final response =
//    await http.get(url);
//
//    List<Map<String, dynamic>> movieJson = json.decode(response.body)['products'];
//
//    if (response.statusCode == 200 && movieJson != null) {
//      for (Map<String, dynamic> movie in movieJson) {
//        movies.add(Movie()); // TODO: Add JSON data to object
//      }
//
//      return movies;
//
//    } else {
//      throw Exception('Failed to load post');
//    }
//  }
//}
