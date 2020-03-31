import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Account {
  final int accountId;
  final String sessionId;
  final String username;
  final String profileURL;

  Account(this.accountId, this.sessionId, this.username, this.profileURL);

  static void saveAccount(Account account) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("account", account.toString());
  }

  static Future<Account> fromJson() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String accountString = preferences.getString("account");
    if (accountString == null || accountString.isEmpty) return null;
    var jsonString = jsonDecode(accountString);
    return Account(
        jsonString['accountId'] as int,
        jsonString['sessionId'] as String,
        jsonString['username'] as String,
        jsonString['profileURL'] as String);
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
