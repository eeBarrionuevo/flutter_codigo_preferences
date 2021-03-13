
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference{


  SharedPreferences _prefs;


  _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

}