import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData {
  static String name = "name";
  static String mail = "email";
  static String logintype = "logintype";

  static Future<bool?> saveName(String username) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(name, username);
  }

  static Future<bool?> saveMail(String useremail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(mail, useremail);
  }

  static Future<bool?> saveLoginType(String loginType) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(logintype, loginType);
  }

  static Future<String?> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(name);
  }

  static Future<String?> getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(mail);
  }

  static Future<String?> getLoginType() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(logintype);
  }
}
