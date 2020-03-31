import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:moviehub/models/movie.dart';
import 'package:moviehub/utils/converter_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NetworkUtils {
  static final String baseUrl = "https://api.themoviedb.org/3/";
  static final String baseGravatarImageUrl = "https://www.gravatar.com/avatar/";

  // Builds a url according to the shared preferences
  static Future<String> urlBuilder(
      String path, SharedPreferences preferences) async {
    List<String> headers = List();

    await DotEnv().load(".env");

    headers.add("?api_key=" +
        DotEnv().env["apiKey"]); // Add API key to the headers list

    if (preferences != null) {
      List<String> filters = preferences.getStringList("filters");
      String sort = preferences.getString("sort");

      if (filters != null) headers.addAll(filters);
      if (sort != null) headers.add("sort_by=" + sort);
    }

    String header = headers.join("&");

    return baseUrl + path + header;
  }

  // Returns the movies parsed into objects of the Movie class
  static Future<List<MovieCardModel>> fetchMovies(String url) async {
    List<MovieCardModel> movies = new List();

    final response = await http.get(url);

    dynamic body = response.body;

    List<dynamic> movieJson = json.decode(body)['results'];

    if (response.statusCode == 200 && movieJson != null) {
      for (Map<String, dynamic> movie in movieJson) {
        movies.add(Converter.convertMovieCard(movie));
      }

      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  static Future<MovieDetailsModel> fetchMovieDetails(int movieId) async {
    await DotEnv().load(".env");
    String apiKey = DotEnv().env["apiKey"];

    final detailsResponse =
        await http.get("${baseUrl}movie/$movieId?api_key=$apiKey");
    final creditsResponse =
        await http.get("${baseUrl}movie/$movieId/credits?api_key=$apiKey");

    Map<String, dynamic> movieJson = json.decode(detailsResponse.body);
    Map<String, dynamic> creditsJson = json.decode(creditsResponse.body);

    if (detailsResponse.statusCode == 200 &&
        creditsResponse.statusCode == 200 &&
        movieJson != null &&
        creditsJson != null) {
      return Converter.convertMovieDetails(movieJson, creditsJson);
    } else
      throw Exception('Failed to load movie');
  }

  static Future<bool> postRating(
      int movieId, int rating, String sessionId) async {
    await DotEnv().load(".env");
    String apiKey = DotEnv().env["apiKey"];

    return http
        .post(
            "${baseUrl}movie/$movieId/rating?api_key=$apiKey&session_id=$sessionId",
            body: jsonEncode({"value": rating}))
        .then((response) => response.statusCode == 200);
  }

  static Future<bool> deleteRating(int movieId, String sessionId) async {
    await DotEnv().load(".env");
    String apiKey = DotEnv().env["apiKey"];

    return http
        .delete(
            "${baseUrl}movie/$movieId/rating?api_key=$apiKey&session_id=$sessionId")
        .then((response) => response.statusCode == 200);
  }

  static Future<bool> createList(
      String name, String description, String sessionId) async {
    await DotEnv().load(".env");
    String apiKey = DotEnv().env["apiKey"];

    return http
        .post("${baseUrl}list?api_key=$apiKey&session_id=$sessionId",
            body: json.encode(
                {"name": name, "description": description, "language": "en"}))
        .then((response) => response.statusCode == 201);
  }

  static Future<bool> deleteList(int listId, String sessionId) async {
    await DotEnv().load(".env");
    String apiKey = DotEnv().env["apiKey"];

    return http
        .delete("${baseUrl}list/$listId?api_key=$apiKey&session_id=$sessionId")
        .then((response) =>
            response.statusCode == 500); // TODO: why internal server error?
  }

  static Future<bool> clearList(int listId, String sessionId) async {
    await DotEnv().load(".env");
    String apiKey = DotEnv().env["apiKey"];
    return http
        .post(
            "${baseUrl}list/$listId?api_key=$apiKey&session_id=$sessionId&confirm=true")
        .then((response) => response.statusCode == 201);
  }

  static Future<bool> addMovieToList(
      int listId, int movieId, String sessionId) async {
    await DotEnv().load(".env");
    String apiKey = DotEnv().env["apiKey"];

    return http
        .post(
            "${baseUrl}list/$listId/add_item?api_key=$apiKey&session_id=$sessionId",
            body: json.encode({"media_id": movieId}))
        .then((response) => response.statusCode == 201);
  }

  static Future<bool> removeMovieFromList(
      int listId, int movieId, String sessionId) async {
    await DotEnv().load(".env");
    String apiKey = DotEnv().env["apiKey"];

    return http
        .post(
            "${baseUrl}list/$listId/remove_item?api_key=$apiKey&session_id=$sessionId",
            body: json.encode({"media_id": movieId}))
        .then((response) => response.statusCode == 201);
  }

  static Future<List<MovieCardModel>> fetchList(int listId) async {
    List<MovieCardModel> movies = List();

    await DotEnv().load(".env");
    String apiKey = DotEnv().env["apiKey"];

    final response = await http.get("${baseUrl}list/$listId?api_key=$apiKey");

    Map<String, dynamic> listJson = jsonDecode(response.body);

    if (response.statusCode == 200 && listJson != null) {
      for (Map<String, dynamic> movieJson in listJson["items"]) {
        movies.add(Converter.convertMovieCard(movieJson));
      }
    }

    return movies;
  }
}
