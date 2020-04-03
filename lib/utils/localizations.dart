import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MovieHubLocalizations {
  final Locale locale;

  MovieHubLocalizations(this.locale);

  static MovieHubLocalizations of(BuildContext context) {
    return Localizations.of<MovieHubLocalizations>(
        context, MovieHubLocalizations);
  }

  static const LocalizationsDelegate<MovieHubLocalizations> delegate = _MovieHubLocalizationsDelegate();

  Map<String, String> _localizedStrings;

  Future<void> load() async {
    _localizedStrings = await rootBundle
        .loadString("lang/${locale.languageCode}.json")
        .then((jsonString) => jsonDecode(jsonString) as Map<String, dynamic>)
        .then((jsonMap) =>
            jsonMap.map((key, value) => MapEntry(key, value.toString())));
  }

  String translate(String key) {
    return _localizedStrings[key];
  }
}

class _MovieHubLocalizationsDelegate extends LocalizationsDelegate<MovieHubLocalizations> {

  const _MovieHubLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'nl'].contains(locale.languageCode);
  }

  @override
  Future<MovieHubLocalizations> load(Locale locale) async {
    MovieHubLocalizations localizations = new MovieHubLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  // No idea what this does, tutorial guy didn't either
  @override
  bool shouldReload(LocalizationsDelegate<MovieHubLocalizations> old) => false;

}