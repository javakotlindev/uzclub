import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/utils/extension.dart';

class MySharedPref {
  MySharedPref._();

  static SharedPreferences? sharedPreferences;
  static final MySharedPref instance = MySharedPref._();

  Future<SharedPreferences> getInstance() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences!;
    } else {
      return sharedPreferences!;
    }
  }

  Future<bool> clearAllData() async {
    SharedPreferences prefs = await getInstance();
    return prefs.clear();
  }

  Future<bool> saveToken(String token) async {
    SharedPreferences prefs = await getInstance();
    myPrint("saveToken: $token");
    return prefs.setString('ACCESS_TOKEN', token);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await getInstance();
    String token = prefs.getString('ACCESS_TOKEN') ?? "";
    return token;
  }

  Future<bool> saveHasAuth(bool hasAuth) async {
    SharedPreferences prefs = await getInstance();
    myPrint("saveHasAuth: $hasAuth");
    return prefs.setBool('HAS_AUTH', hasAuth);
  }

  Future<bool> getHasAuth() async {
    SharedPreferences prefs = await getInstance();
    bool hasAuth = prefs.getBool('HAS_AUTH') ?? false;
    return hasAuth;
  }

  Future<bool> saveRefreshToken(String token) async {
    SharedPreferences prefs = await getInstance();
    myPrint("saveRefreshToken: $token");
    return prefs.setString('REFRESH_TOKEN', token);
  }

  Future<String> getRefreshToken() async {
    SharedPreferences prefs = await getInstance();
    String token = prefs.getString('REFRESH_TOKEN') ?? "";
    return token;
  }
}
