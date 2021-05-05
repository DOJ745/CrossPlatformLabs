import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesMethods {

  addStringToSF(String key, String someStr) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, someStr);
  }
  getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(key);
    return stringValue;
  }

  addIntToSF(String key, int someInt) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, someInt);
  }
  getIntValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int intValue = prefs.getInt(key);
    return intValue;
  }

  addDoubleToSF(String key, double someDouble) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, someDouble);
  }
  getDoubleValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double doubleValue = prefs.getDouble(key);
    return doubleValue;
  }


  addBoolToSF(String key, bool someBool) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, someBool);
  }
  getBoolValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool boolValue = prefs.getBool(key);
    return boolValue;
  }

  removeValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}