import 'dart:convert';
import 'dart:html';

import 'package:shared_preferences/shared_preferences.dart';

class Account {
  final int accountId;
  final int sessionId;
  final String username;
  final String profileURL;

  Account(this.accountId, this.sessionId, this.username, this.profileURL);

  void saveAccount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("account", this.toString());
  }

   Future<Account> fromJson() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String accountString = preferences.getString("account");
    if (accountString == null || accountString.isEmpty) return null;
    var jsonString = jsonDecode(accountString);
    return Account(jsonString['accountId'] as int, jsonString['sessionId'] as int, jsonString['username'] as String, jsonString['profileURL'] as String);
  }

  @override
  String toString() {
    return '{ ${this.accountId}, ${this.sessionId}, ${this.username}, ${this.profileURL} }';
  }
}
